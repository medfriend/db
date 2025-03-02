# Habilitar el plugin STOMP
docker exec rabbitmq-medfriend rabbitmq-plugins enable rabbitmq_stomp

# Habilitar el plugin Web STOMP que permite conexiones WebSocket
docker exec rabbitmq-medfriend rabbitmq-plugins enable rabbitmq_web_stomp
