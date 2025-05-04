#bash
docker run -v $HOME/.apigee-secure:/root/.apigee-secure:ro \
   -v $(pwd)/resources:/apigee-workspace/apigee-helm/resources:ro \
   -v $(pwd)/molecule:/apigee-workspace/apigee-helm/molecule:rw \
   -v $HOME/.config:/root/.config/gcloud:rw \
   -v $(pwd)/work_dir:/apigee-workspace/apigee-helm/work_dir:rw \
   -ti \
   apigee-workspace-v1 bash
