# Use Red Hat Universal Base Image Minimal
FROM registry.access.redhat.com/ubi8/ubi

# Install msmtp and ca-certificates
USER 0

RUN microdnf -y install  dnf
RUN dnf -y install 'dnf-command(config-manager)'
RUN dnf config-manager --set-enabled ubi-8-codeready-builder-rpms
RUN dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf install -y epel-release
RUN dnf install -y perl
RUN dnf install -y wget
RUN dnf install -y tar
 RUN dnf install -y gzip
RUN dnf -y install msmtprc
RUN dnf -y install ca-certificates
RUN dnf clean all
# Copy the script and configuration files
COPY send-mail.sh send-mail.sh
COPY msmtprc /etc/msmtprc

# Set permissions for the script
RUN chmod +x send-mail.sh

# Default command
CMD ["send-mail.sh"]
