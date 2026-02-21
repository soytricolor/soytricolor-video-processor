FROM node:20-slim

# Instalar ffmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

ENV PORT=8080
EXPOSE 8080

CMD ["node", "index.js"]
