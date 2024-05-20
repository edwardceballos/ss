# Use Red Hat Universal Base Image Minimal
FROM registry.access.redhat.com/ubi8/ubi

# Install msmtp and ca-certificates
RUN microdnf update -y
RUN microdnf install -y msmtp ca-certificates
RUN microdnf clean all

# Copy the script and configuration files
COPY send-mail.sh send-mail.sh
COPY msmtprc /etc/msmtprc

# Set permissions for the script
RUN chmod +x send-mail.sh

# Default command
CMD ["send-mail.sh"]
