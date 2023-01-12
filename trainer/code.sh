     #mkdir -p /home/jupyter/titanic/trainer
     #touch /home/jupyter/titanic/setup.py /home/jupyter/titanic/trainer/__init__.py /home/jupyter/titanic/trainer/task.py
    export REGION="europe-west4"
    export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
    export BUCKET_NAME=$PROJECT_ID"-bucket"
    gsutil mb -l $REGION "gs://"$BUCKET_NAME
    cd /home/jupyter/titanic
    pip install setuptools
    python setup.py install
    
    python -m trainer.task -v \
    --model_param_kernel=linear \
    --model_dir="gs://"$BUCKET_NAME"/titanic/trial" \
    --data_format=bigquery \
    --training_data_uri="bq://"$PROJECT_ID".titanic.survivors" \
    --test_data_uri="bq://"$PROJECT_ID".titanic.survivors" \
    --validation_data_uri="bq://"$PROJECT_ID".titanic.survivors"
    
    cd /home/jupyter/titanic
    python setup.py sdist    
    
    gsutil cp dist/trainer-0.1.tar.gz "gs://"$BUCKET_NAME"/titanic/dist/trainer-0.1.tar.gz"
    
    
