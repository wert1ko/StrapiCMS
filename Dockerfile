# Use the official Node.js image as the base image
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy only the necessary files to install dependencies
COPY package*.json ./

# Install Strapi and dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the Strapi admin panel for production
RUN npm run build

# Expose the Strapi port
EXPOSE 1337

# Start Strapi in production mode
CMD ["npm", "run", "start"]
