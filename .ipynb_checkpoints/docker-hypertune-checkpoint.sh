git remote add gcml-remote https://github.com/vk34git/gcml
git config --global user.email "vk34@yahoo.com"
git config --global user.name "vas"
git config --global user.password "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"
git pull
export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
IMAGE_URI="gcr.io/$PROJECT_ID/horse-human:hypertune"
docker build ./ -t $IMAGE_URI
docker push $IMAGE_URI
git add .
git commit -m "initial" .
git push gcml-remote master 
