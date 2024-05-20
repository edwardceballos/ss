# Use Alpine Linux as the base image
FROM alpine:latest

# Install msmtp and ca-certificates for SSL
RUN apk add --no-cache msmtp ca-certificates

# Copy the script and configuration files
COPY send-mail.sh send-mail.sh
COPY msmtprc /etc/msmtprc

# Set permissions for the script
RUN chmod +x send-mail.sh

# Default command
CMD ["send-mail.sh"]
