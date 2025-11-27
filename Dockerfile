# Usamos una imagen base muy vieja (llena de vulnerabilidades)
FROM python:3.6-alpine

WORKDIR /app

# Copiamos los archivos
COPY . .

# Instalamos dependencias
RUN pip install -r requirements.txt

# ERROR: Ejecutamos la app como 'root' (mala práctica)
CMD ["python", "app.py"]