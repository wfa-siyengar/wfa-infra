#!/bin/sh

# env.sh

# Change the contents of this output to get the environment variables
# of interest. The output must be valid JSON, with strings for both
# keys and values.
cat <<EOF
{
  "PROJECT_ID": "$PROJECT_ID",
  "PRIVATE_KEY_ID": "$PRIVATE_KEY_ID",
  "PRIVATE_KEY": "$PRIVATE_KEY",
  "CLIENT_EMAIL": "$CLIENT_EMAIL",
  "CLIENT_ID": "$CLIENT_ID",
  "AUTH_URI": "$AUTH_URI",
  "TOKEN_URI": "$TOKEN_URI",
  "AUTH_PROVIDER_X509_CERT_URL": "$AUTH_PROVIDER_X509_CERT_URL",
  "CLIENT_X509_CERT_URL": "$CLIENT_X509_CERT_URL"
}
EOF