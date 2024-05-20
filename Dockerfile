# Use Alpine Linux as the base image
FROM alpine:latest

# Install msmtp and ca-certificates for SSL
RUN apk add --no-cache msmtp ca-certificates

# Copy the script and configuration files
COPY send-mail.sh /usr/local/bin/send-mail.sh
COPY msmtprc /etc/msmtprc

# Set permissions for the script
RUN chmod +x /usr/local/bin/send-mail.sh

# Default command
CMD ["/usr/local/bin/send-mail.sh"]
