# Use the official Nginx image as the base image
FROM nginx:alpine

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Remove the default Nginx static files
RUN rm -rf ./*


# Copy the index.html file from the current directory to the container
COPY index.html .

# Expose port 80 to allow traffic to the container
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
