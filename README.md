### EKS Cluster Rear Demo ###

## Prerequisits ## 

* An AWS account with CLI access to the account 
* An ACM cert - it's ARN is necessary in the yaml of the [demo-app.yaml](https://github.com/hitekhippy/rearc_demo/blob/d64e8c0b096809c44fb7987a794069d0b3a7e7fd/cluster_resources/demo-app.yaml#L6)
* A existing a repo where you can pull the image from. It's needed [here]()

## Dependencies ## 
  | Dependency | Version | Notes | Required | 
  | ------------- | ------------- | --- | --- |
  | terraform  | 0.14.8   | This will be handled by tfenv if you have it installed | Yes | 
  | kubectl | 1.18.2 | | Yes | 
  | awscli | 2.1.5 | | Yes | 
  | jq | 1.6 | Not a strict requirement, but ease of use thing | No | 

## Usage ## 

# Deploying the infrastructure # 

Pretty striaght foward just need to `terraform init` then `terraform apply`. 

After the apply is complete (this will take some time, quite a few resources are generated) you can run the below command to automatically update your kubeconfig with the newly created EKS cluster config to allow you to access the cluster. 
`aws eks --region $(terraform output region | jq -r) update-kubeconfig --name $(terraform output cluster_name | jq -r)` 

Check to see if you can see your new cluster using the awscli `aws eks list-clusters`. 

# Deploy the image. # 

The `cluster_resource` directory holds yaml files for K8's resources inside the cluster E.G deployments/daemonsets etc. *NOTE* You'll need to insert your own image into the demo-app.yml image field near the bottom. 

Move into the ./cluster_resource/ directory and run `kubectl apply -f demo-app.yaml` 
