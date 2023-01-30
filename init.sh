mkdir -p ~/.config/gcloud/
echo "{
  \"PROJECT_ID\": \"$1\", \"PRIVATE_KEY_ID\": \"$2\", \"PRIVATE_KEY\": \"$3\"
}" > ~/.config/gcloud/application_default_credentials.json

