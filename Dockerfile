FROM node:18-slim

# Instalacja zależności
RUN apt-get update && \
    apt-get install -y nginx supervisor curl gnupg && \
    apt-get clean

# Instalacja n8n (najstabilniejsza wersja)
RUN npm install --global n8n

# Skopiuj pliki HTML (Google Verification) do nginx
COPY ./public /usr/share/nginx/html

# Skopiuj konfigurację nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Skopiuj konfigurację supervisora
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Ustaw working directory
WORKDIR /data

# Ustaw port na który nasłuchuje nginx
EXPOSE 80

# Start nginx + n8n
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
