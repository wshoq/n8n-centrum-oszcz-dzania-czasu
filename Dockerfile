FROM n8nio/n8n:latest

# Instalujemy nginx
USER root
RUN apt-get update && apt-get install -y nginx

# Kopiujemy pliki Google do nginx (w folder /usr/share/nginx/html)
COPY ./public /usr/share/nginx/html

# Kopiujemy konfigurację nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Uruchamiamy nginx i n8n jednocześnie
CMD service nginx start && /bin/sh -c "n8n start"
