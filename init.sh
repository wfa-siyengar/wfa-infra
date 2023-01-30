mkdir -p ~/.config/gcloud/
echo "{
  "PROJECT_ID": $1
}" > ~/.config/gcloud/application_default_credentials.json

