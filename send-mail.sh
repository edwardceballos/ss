#!/bin/bash

# Email parameters
sender_email="notificacionesSISFV.prod@minvivienda.gov.co"
to="hehiffupougra-4315@yopmail.com"
subject="Test Email"
html_body="<h1>This is a test email.</h1>"

# Send email
echo -e "Subject: $subject\nFrom: $sender_email\nTo: $to\nContent-Type: text/html\n\n$html_body" | msmtp --from=$sender_email -t $to

# Check if email was sent successfully
if [ $? -eq 0 ]; then
        echo "Email sent successfully."
else
        echo "Failed to send email."
