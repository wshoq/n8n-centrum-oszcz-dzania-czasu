FROM n8nio/n8n:latest

USER root

# Zainstaluj nginx
RUN apt-get update && apt-get install -y nginx

# Skopiuj pliki weryfikacyjne (np. google*.html) do nginx
COPY ./public /usr/share/nginx/html

# Skopiuj konfigurację nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Uruchom nginx + n8n razem
CMD service nginx start && n8n start
