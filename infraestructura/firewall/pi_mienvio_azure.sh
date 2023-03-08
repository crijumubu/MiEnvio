sudo ufw enable

# Puerto requerido para la conexión a través de ssh y el correcto funcionamiento del servidor sftp

sudo ufw allow 22/tcp

sudo ufw status verbose