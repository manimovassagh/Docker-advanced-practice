
FROM node:18-alpine AS build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

RUN npm run build
FROM nginx:alpine AS production-stage
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=build-stage /app/build . 
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]





