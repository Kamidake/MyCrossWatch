FROM ghcr.io/cenodude/crosswatch:latest

# Install socat for port redirection
USER root
RUN apt-get update && apt-get install -y socat && rm -rf /var/lib/apt/lists/*
USER node

# Expose Miget's expected port
EXPOSE 5000

# Wrap the original startup command to run socat in the background
CMD ["sh", "-c", "socat TCP-LISTEN:5000,fork TCP:127.0.0.1:8787 & exec python -m crosswatch"]
