# FROM node:lts-alpine
# COPY ./ ./
# RUN npm ci && npm run build
# EXPOSE 8080
# ENTRYPOINT [ "npm", "run", "start" ]
# LABEL org.opencontainers.image.source="https://github.com/Niek/obs-web"

FROM node:lts-alpine

WORKDIR /app

# Copy only package files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm ci

# Now copy the rest of the files
COPY . .

# Build the app
RUN npm run build

EXPOSE 8080

# Use CMD instead of ENTRYPOINT (more flexible)
CMD ["npm", "run", "start"]

LABEL org.opencontainers.image.source="https://github.com/Niek/obs-web"
