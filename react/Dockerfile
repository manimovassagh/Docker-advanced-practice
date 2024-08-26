# Use the official Node.js image.
FROM node:22

# Set the working directory inside the container.
WORKDIR /app

# Copy the package.json and package-lock.json (if present) into the container.
COPY package.json ./

# Install the dependencies.
RUN npm install --sleep

# Copy the rest of the application files.
COPY . .

# Expose the Vite development server port.
EXPOSE 5173

# Start the Vite development server.
CMD ["npm", "run", "dev"]
