#aqui se encuentra los script para inicializar los server necesarios para el funcionamiento del backend

# version de docker compose

##comando para levantar en desarrollo
```bash
docker-compose -f docker-compose-dev.yml --env-file .env.dev up -d
```

##comando para levantar en despliegue
```bash
docker-compose -f docker-compose-build.yml up -d
```

# version de kubernetes

##comando para levantar en desarrollo
- cambiar la configuracion de docker-compose por docker-compose-dev.yml
- cambiar la configuracion de .env por .env.dev

```bash
./convertir-compose.sh
```

comando para generacion de copias de seguridad
```bash
pg_dump -h localhost -U elliot -W -F c -b -v -f med-friend.dump med-friend
```


