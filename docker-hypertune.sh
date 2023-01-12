export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
IMAGE_URI="gcr.io/$PROJECT_ID/horse-human:hypertune"
docker build ./ -t $IMAGE_URI
docker push $IMAGE_URI
