mkdir -p ~/.config/gcloud/
touch ~/.config/gcloud/application_default_credentials.json
echo "{
  "PROJECT_ID": ${{ secret.PROJECT_ID }}
}"
