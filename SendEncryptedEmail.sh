#!/bin/bash

#EMAIL_MESSAGE=email_body.txt
#SENDER_PRIVATE_KEY=sender-key.pem
#SENDER_CERTIFICATE=sender-certificate.pem
#SENDER_ADDRESS=sender@mail.localhost
#RECIPIENT_ADDRESS=recipient@mail.localhost
#RECIPIENT_CERTIFICATE=recipient-certificate.pem
#SUBJECT="Signed and Encrypted message via OpenSSL"

EMAIL_MESSAGE=email_body.txt
SENDER_PRIVATE_KEY=sender-key.pem
SENDER_CERTIFICATE=sender-certificate.pem
SENDER_ADDRESS=sender@mail.localhost
RECIPIENT_ADDRESS=mberkman@cisco.com
RECIPIENT_CERTIFICATE=mberkman-certificate.pem
SUBJECT="Signed and Encrypted message via OpenSSL"


openssl smime -sign -in "${EMAIL_MESSAGE}" -signer "${SENDER_CERTIFICATE}" -inkey "${SENDER_PRIVATE_KEY}" -text \
| openssl smime -encrypt -from "${SENDER_ADDRESS}" -to "${RECIPIENT_ADDRESS}" \
  -subject "${SUBJECT}" -des3 "${RECIPIENT_CERTIFICATE}" \
| sendmail "${RECIPIENT_ADDRESS}"
