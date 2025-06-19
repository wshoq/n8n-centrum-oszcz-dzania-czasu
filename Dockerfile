FROM n8nio/n8n:latest

USER root

# Zainstaluj nginx i supervisor
RUN apt-get update && apt-get install -y nginx supervisor

# Skopiuj pliki HTML (np. google*.html) do katalogu nginx
COPY ./public /usr/share/nginx/html

# Skopiuj konfigurację nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Skopiuj konfigurację supervisora
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Uruchom supervisor, który wystartuje nginx + n8n
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
