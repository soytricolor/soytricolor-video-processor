FROM node:20-slim

WORKDIR /usr/src/app

# Copia manifests primero (cache)
COPY package*.json ./

# Instala deps: si hay lock usa ci, si no hay lock usa install
RUN if [ -f package-lock.json ]; then npm ci --omit=dev; else npm install --omit=dev; fi

# Copia el resto
COPY . .

ENV PORT=8080
EXPOSE 8080

CMD ["node", "index.js"]
