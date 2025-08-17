FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install dependencies needed for node-gyp / better-sqlite3
RUN apk add --no-cache python3 make g++

# Copy package files first
COPY package*.json ./

# Install Node.js dependencies
RUN npm install --production

# Copy the rest of the source code
COPY . .

# Expose port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
