FROM ghcr.io/cenodude/crosswatch:latest

# Ensure we operate as root so volume mounts and package installations succeed
USER root

# Install socat for port redirection from 5000 to 8787
RUN apt-get update && apt-get install -y socat && rm -rf /var/lib/apt/lists/*

# Expose Miget's expected routing port
EXPOSE 5000

# Start socat in the background to forward port 5000 to CrossWatch (port 8787), then launch the app
CMD ["sh", "-c", "socat TCP-LISTEN:5000,fork TCP:127.0.0.1:8787 & exec python -m crosswatch"]
