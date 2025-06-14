#aqui se encuentra los script para inicializar los server necesarios para el funcionamiento del backend

#comando para levantar en desarrollo
```bash
docker-compose -f docker-compose-dev.yml --env-file .env.dev up -d
```

#comano para levantar en despliegue
```bash
docker-compose -f docker-compose-build.yml up -d
```

comando para generacion de copias de seguridad
```bash
pg_dump -h localhost -U elliot -W -F c -b -v -f med-friend.dump med-friend
```


