
docker build -t gcr.io/friasc-apigee-lab/apigee-workspace/apigee-helm-installer .

docker run --rm -it --name apigee-helm-installer -v ~/.apigee-secure:/.apigee-secure -v $(pwd)/work_dir:/installer/work_dir -v $(pwd)/resources:/installer/resources gcr.io/friasc-apigee-lab/apigee-workspace/apigee-helm-installer


