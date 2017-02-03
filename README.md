# container_allocation_for_mta
Experiment on container allocation strategy

This github repository is an addition to our paper submission entitled: "Container orchestration for configurable performance isolation in multi-tenant SaaS."

The aim of the experiment is to demonstrate the third container allocation strategy in Kubernetes: Separate Namespace / SLA class.

As test service we use a tomcat webservice

We configure three SLA classes by associating different requests and limits to each Namespace: see https://github.com/eddytruyen/container_allocation_for_mta/tree/master/tomcat-sla/slas

We have setup a Kubernetes cluster with 6 worker nodes using the docker-multinode project: https://github.com/kubernetes/kube-deploy/tree/master/docker-multinode

To deploy the experiment execute `./deploy_experiment.sh`

To run the experiment: `./run_experiment.sh`

To tear down the experiment: `./teardown_experiment.sh`

Collected experiment data and analysis of data as presented in Figure 4 of the paper is available at https://github.com/eddytruyen/container_allocation_for_mta/tree/master/tomcat-sla/experiment_data_25082016



