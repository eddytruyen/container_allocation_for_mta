# Container orchestration for multi-tenant SaaS

This github repository is an addition to our manuscript submission entitled: "Container orchestration for adaptive performance isolation  of multi-tenant SaaS." It contains the code and data of the experiment presented in Figure 3 of the article.

The aim of the experiment is to demonstrate the third container allocation strategy in Kubernetes: Separate Namespace / SLA class.

# Experimental setup
We have setup a Kubernetes cluster with 6 worker nodes using the docker-multinode project: https://github.com/kubernetes/kube-deploy/tree/master/docker-multinode. Kubernetes version 1.3.4 has been used.

This cluster has been installed on 7 Ubuntu 14.04 virtual machines that run in an Openstack private cloud with the following properties:
* Openstack version Liberty is installed on 8 droplets (each with 16 cpu-cores). There is no VM pinning. Other users are running workloads on the Openstack cloud
* Each Ubuntu VM is configured of flavor c2m2 (2 virtual cpu and 2 GB of ram) 
* At the moment of the performance evaluation, the Openstack cloud is overcommitted: https://github.com/eddytruyen/container_allocation_for_mta/blob/master/tomcat-sla/Openstack.JPG

Docker has been installed on each node with the `./dockerinstall` script. 

As test service we haved used a tomcat webservice: https://github.com/eddytruyen/container_allocation_for_mta/tree/master/tomcat-sla

We configure three SLA classes by associating different requests and limits to each Namespace: see https://github.com/eddytruyen/container_allocation_for_mta/tree/master/tomcat-sla/slas

# Running the experiment
We setup 3 tomcat services each with 5 replicas. Each tomcat service belongs to a different SLA class (gold, silver, bronze). To each tomcat service 1 million GET requests are concurrently sent from the a remote client. The timings in the table are measured at the client side using curl and report the time when the first byte of response is received.

Below we refer to a number of scripts to automatically deploy, run and tear down the experiment. To fully automate these scripts, we need access to the API of the Kubernetes master for determining the specific nodePort of each service. As such, these scripts need to be run at the master node of the cluster.

To deploy the experiment execute `./deploy_experiment.sh`

To run the experiment execute `./run_experiment.sh`

To tear down the experiment execute `./teardown_experiment.sh`

Collected experiment data and analysis of data as presented in Figure 4 of the paper is available at https://github.com/eddytruyen/container_allocation_for_mta/tree/master/tomcat-sla/experiment_data_25082016


