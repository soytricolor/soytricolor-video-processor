FROM node:20-slim

# ffmpeg
RUN apt-get update \
    && apt-get install -y ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copia todo el repo primero (evita que COPY package*.json falle con "no source files")
COPY . .

# Verifica que exista package.json y muestra qué hay si falta
RUN test -f package.json || (echo "ERROR: package.json NO está en el contexto de build. Archivos en /app:" && ls -la && exit 1)

# Instala dependencias
RUN if [ -f package-lock.json ]; then npm ci --omit=dev; else npm install --omit=dev; fi

ENV PORT=8080
EXPOSE 8080

CMD ["node", "index.js"]
