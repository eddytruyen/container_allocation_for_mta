for sla in `ls slas` 
  do 
   namespace=`sed -e 's#.*_\(\)#\1#' <<< ${sla}`
   echo SLA configuration ${namespace}
   echo ==============================
   kubectl create -f slas/${sla}/namespace.yaml
   kubectl create -f resourcequota/compute-resources.yaml --namespace=${namespace}
   kubectl create -f slas/${sla}/limits.yaml --namespace=${namespace}
   kubectl create -f tomcat-service.yaml --namespace=${namespace}
   kubectl create -f tomcat-controller.yaml --namespace=${namespace}
  done
