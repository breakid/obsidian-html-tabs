FROM node:24-alpine

# Set working directory
WORKDIR /workspace

COPY package*.json ./
COPY pnpm-lock.yaml ./

USER root

# Install project dependencies
RUN npm install --global corepack@latest && \
    corepack enable pnpm && \
    yes | pnpm install --frozen-lockfile

ENTRYPOINT [ "/usr/local/bin/pnpm" ]
CMD [ "run", "build" ]
# ENTRYPOINT [ "/bin/sh" ]
