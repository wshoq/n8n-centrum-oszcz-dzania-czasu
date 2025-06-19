FROM n8nio/n8n:latest

# Dodaj folder public z plikiem Google weryfikacyjnym
COPY ./public /usr/local/share/n8n/public
