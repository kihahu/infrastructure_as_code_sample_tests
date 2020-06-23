.phny: all

test-sqs:
	go test -run TestTerraformSQS

test-sns:
	go test -run TestTerraformSNS

test-kube-helm:
	go test --tags helm -run TestHelmBasicExampleDeployment

test-kube-deploy:
	go test --tags kubernetes -run TestKubernetesBasicExampleServiceCheck

test-gcp-spanner:
	go test --tags gcp -run TestGcpSpanner

test-terraform:
	go test --tags terraform

test-gcp:
	go test --tags gcp

test-aws:
	go test --tags aws

test-k8s:
	go test --tags kubeall

all: test-sqs test-sns test-helm test-deployment