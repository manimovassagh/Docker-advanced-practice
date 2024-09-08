FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

# Expose port 3000
EXPOSE 3000

# Use CMD to start the application when the container starts
CMD ["node", "index.js"]
