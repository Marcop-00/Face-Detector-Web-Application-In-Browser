# Use Nginx Alpine (Lightweight)
FROM nginx:alpine

# 1. Install OpenSSL to generate self-signed certs
RUN apk add --no-cache openssl

# 2. Create SSL directory
RUN mkdir -p /etc/nginx/ssl

# 3. Generate a Self-Signed Certificate
# This command creates a certificate valid for 365 days
RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/selfsigned.key \
    -out /etc/nginx/ssl/selfsigned.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"

# 4. Copy your Custom Nginx Config
COPY nginx.conf /etc/nginx/nginx.conf

# 5. Copy your Application files
COPY index.html style.css script.js /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/

# Expose both HTTP and HTTPS ports
EXPOSE 80
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]