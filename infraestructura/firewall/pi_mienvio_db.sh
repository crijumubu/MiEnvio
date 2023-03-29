sudo ufw enable

# Puertos requeridos para la conexión a través de ssh y la conexión a la base de datos

sudo ufw allow 22/tcp,27017/tcp

sudo ufw status verbose