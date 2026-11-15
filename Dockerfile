FROM ghcr.io/cenodude/crosswatch:latest

# Ensure we operate as root so volume mounts succeed
USER root

# Expose Miget's routing port
EXPOSE 5000

# Run CrossWatch directly; it will automatically bind to Miget's PORT environment variable
CMD ["python", "-m", "crosswatch"]
