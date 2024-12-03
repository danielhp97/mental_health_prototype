# Stage 1: Build the Vue app
FROM node:18-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the app source code
COPY . .

# Build the Vue app
RUN npm run build

# Stage 2: Serve the app with NGINX
FROM nginx:alpine

# Set the working directory inside NGINX
WORKDIR /usr/share/nginx/html

# Copy built assets from the builder stage to NGINX
COPY --from=builder /app/dist .

# Expose the NGINX default HTTP port
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]