FROM docker:dind

# System dependencies
RUN apk update && apk add --no-cache \
    bash \
    curl \
    git \
    yaml-dev \
    build-base \
    openssl-dev \
    readline-dev \
    zlib-dev \
    libffi-dev \
    nodejs \
    npm \
    ruby-dev \
    docker \
    openrc \
    openssh-client-default

# Install Kamal
RUN gem install kamal --no-document

# Install Bitwarden CLI
RUN npm install -g @bitwarden/cli

# Set up SSH configuration
RUN mkdir -p ~/.ssh && \
    chmod 700 ~/.ssh && \
    chmod 644 ~/.ssh/known_hosts

# Set working directory
WORKDIR /app

# Keep container running for dind
CMD ["dockerd"]
