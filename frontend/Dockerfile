FROM nginx:alpine

# Remove default nginx content and copy frontend files
RUN rm -rf /usr/share/nginx/html/*
COPY frontend/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
FROM node:18-alpine

WORKDIR /app

# Copy all frontend files
COPY . .

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/ || exit 1

# Start the custom Node.js server that serves home.html as default
CMD ["node", "server.js"]
