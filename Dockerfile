# Use the official Nginx image
FROM nginx:alpine

# Copy your website files to the Nginx default HTML directory
COPY index.html /usr/share/nginx/html/index.html
COPY images /usr/share/nginx/html/images

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
