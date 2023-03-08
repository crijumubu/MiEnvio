sudo ufw enable

# Puertos requeridos para la conexión a través de ssh y el correcto funcionamiento del servicio de la aplicaicón

sudo ufw allow 22/tcp,1802/tcp

sudo ufw status verbose