echo "Storing the key and endpoint in environment variables..."
echo "--------------------------------------------------------"
AZUREOPENAI_KEY=$(
  az cognitiveservices account keys list \
    --name "$COGNITIVE_SERVICE" \
    --resource-group "$RESOURCE_GROUP" \
    | jq -r .key1
)
AZUREOPENAI_ENDPOINT=$(
  az cognitiveservices account show \
    --name "$COGNITIVE_SERVICE" \
    --resource-group "$RESOURCE_GROUP" \
    | jq -r .properties.endpoint
)

# Set the properties
echo "--------------------------------------------------"
echo "The following properties can be copied to either the rest-narration/src/main/resources/conf.properties or to the ~/.sk/conf.properties file:"
echo "--------------------------------------------------"
echo "client.azureopenai.key=$AZUREOPENAI_KEY"
echo "client.azureopenai.endpoint=$AZUREOPENAI_ENDPOINT"
echo "client.azureopenai.deploymentname=$COGNITIVE_DEPLOYMENT"
