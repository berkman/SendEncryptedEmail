#!/bin/bash

#[Generate a private key using OpenSSL]
openssl req -newkey rsa:2048 -nodes -keyout sender-key.pem -config smime.cfg \
 | openssl x509 -req -days 365 -signkey sender-key.pem -out sender-certificate.pem \
 -set_serial 1 -extensions smime -extfile smime.cfg
