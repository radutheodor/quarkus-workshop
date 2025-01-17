# Clean up
az group delete \
  --name "$RESOURCE_GROUP" \
  --yes

az cognitiveservices account purge \
  --name "$COGNITIVE_SERVICE" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION"

az cognitiveservices account delete \
  --name "$COGNITIVE_SERVICE" \
  --resource-group "$RESOURCE_GROUP"
