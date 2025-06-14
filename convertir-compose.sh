#!/bin/bash

# Cargar variables desde .env
set -a
source .env.dev
set +a

# Validar que docker-compose-dev.yml exista
if [ ! -f docker-compose-dev.yml ]; then
    echo "❌ Archivo docker-compose-dev.yml no encontrado"
    exit 1
fi

# Reemplazar variables con envsubst y guardar archivo temporal
envsubst < docker-compose-dev.yml > docker-compose-rendered.yml

# Verificar si kompose está instalado
if ! command -v kompose &> /dev/null; then
    echo "❌ kompose no está instalado. Instálalo con: sudo apt install kompose"
    exit 1
fi

# Ejecutar kompose
kompose -f docker-compose-rendered.yml convert

# Limpiar archivo temporal si quieres
rm docker-compose-rendered.yml

echo "✅ Conversión completada. Aplica los archivos con: kubectl apply -f ."
