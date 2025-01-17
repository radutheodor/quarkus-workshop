echo "Setting up environment variables..."
echo "----------------------------------"
PROJECT="quarkus-workshop"
RESOURCE_GROUP="rg-$PROJECT"
LOCATION="eastus"
TAG="$PROJECT"
COGNITIVE_SERVICE="cognit-$PROJECT"
COGNITIVE_DEPLOYMENT="gpt35turbo"

echo "Creating the resource group..."
echo "------------------------------"
az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --tags system="$TAG"


echo "Creating the Cognitive Service..."
echo "---------------------------------"
az cognitiveservices account create \
  --name "$COGNITIVE_SERVICE" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --custom-domain "$COGNITIVE_SERVICE" \
  --tags system="$TAG" \
  --kind "OpenAI" \
  --sku "S0"


echo "Deploying the model..."
echo "----------------------"
az cognitiveservices account deployment create \
  --name "$COGNITIVE_SERVICE" \
  --resource-group "$RESOURCE_GROUP" \
  --deployment-name "$COGNITIVE_DEPLOYMENT" \
  --model-name "gpt-35-turbo" \
  --model-version "0301"  \
  --model-format "OpenAI" \
  --sku-capacity 1 \
  --sku-name "Standard"
