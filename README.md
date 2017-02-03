# Container allocation strategies for multi-tenant SaaS applications

This github repository is an addition to our paper submission entitled: "Container orchestration for configurable performance isolation in multi-tenant SaaS." It contains the code and data of the experiment presented in Figure 4 of the paper.

The aim of the experiment is to demonstrate the third container allocation strategy in Kubernetes: Separate Namespace / SLA class.

# Experimental setup
We have setup a Kubernetes cluster with 6 worker nodes using the docker-multinode project: https://github.com/kubernetes/kube-deploy/tree/master/docker-multinode

This cluster has been installed on Ubuntu 14.04 virtual machines that run in an Openstack private cloud with the following properties:
* Openstack version Kilo installed on 9 droplets (each with 16 cpu-cores). There is no VM pinning. Other users are running workloads on the Openstack cloud
* Each Ubuntu VM is configured of flavor c2m2 (2 virtual cpu and 2 GB of ram) 

Docker has been installed on each node with the `./dockerinstall` script. 

As test service we haved used a tomcat webservice: https://github.com/eddytruyen/container_allocation_for_mta/tree/master/tomcat-sla

We configure three SLA classes by associating different requests and limits to each Namespace: see https://github.com/eddytruyen/container_allocation_for_mta/tree/master/tomcat-sla/slas

# Running the experiment
We setup 3 tomcat services each with 5 replicas. Each tomcat service belongs to a different SLA class (gold, silver, bronze). To each tomcat service 106 GET requests are concurrently sent from a remote client. The timings in the table are measured at the client side using curl and report the time when the first byte of response is received.

To deploy the experiment execute `./deploy_experiment.sh`

To run the experiment execute `./run_experiment.sh`

To tear down the experiment execture `./teardown_experiment.sh`

Collected experiment data and analysis of data as presented in Figure 4 of the paper is available at https://github.com/eddytruyen/container_allocation_for_mta/tree/master/tomcat-sla/experiment_data_25082016



d
