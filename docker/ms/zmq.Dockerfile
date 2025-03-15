# Usar una imagen base que tenga las herramientas necesarias
FROM debian:bullseye as builder

# Instalar dependencias necesarias para la compilación de ZeroMQ y Go
RUN apt-get update && apt-get install -y \
    build-essential \
    autoconf \
    automake \
    libtool \
    pkg-config \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Descargar e instalar Go
RUN wget https://go.dev/dl/go1.23.3.linux-amd64.tar.gz \
    && tar -xzf go1.23.3.linux-amd64.tar.gz \
    && mv go /usr/local \
    && rm go1.23.3.linux-amd64.tar.gz

# Establecer variables de entorno para Go
ENV PATH=$PATH:/usr/local/go/bin \
    GOPATH=/go \
    GO111MODULE=on

# Crear el directorio de trabajo para Go
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# Descargar el código fuente de ZeroMQ
RUN wget -O zeromq.tar.gz https://github.com/zeromq/libzmq/releases/download/v4.3.4/zeromq-4.3.4.tar.gz \
    && tar -xzf zeromq.tar.gz \
    && rm zeromq.tar.gz

# Cambiar al directorio del código fuente de ZeroMQ
WORKDIR /zeromq-4.3.4

# Configurar el proyecto ZeroMQ con soporte para drafts
RUN ./configure --enable-drafts

# Compilar e instalar ZeroMQ
RUN make && make install

# Actualizar la configuración de las librerías compartidas
RUN ldconfig

WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies
RUN go mod download

# Copy the source code into the container, incluyendo el .env
COPY . .

# ✅ Copiar el archivo .env a la misma ubicación donde está main.go
COPY .env /app/.env

# Build the Go app
RUN CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -o myapp

# Expose port 8090 to the outside world
EXPOSE 5555 7777 8888 9999

# Command to run the executable
CMD ["./myapp"]