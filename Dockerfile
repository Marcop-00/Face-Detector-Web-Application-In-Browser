# Use the lightweight Nginx image
FROM nginx:alpine

# Copy your HTML file to the default Nginx folder
# (Assumes your file is named 'index.html')
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]