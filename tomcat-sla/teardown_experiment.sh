for sla in `ls slas` 
  do 
   namespace=`sed -e 's#.*_\(\)#\1#' <<< ${sla}`
   echo teardown ${namespace}
   echo ==============================
   kubectl delete service tomcat-service --namespace=${namespace}
   kubectl delete rc tomcat-controller --namespace=${namespace}
   kubectl delete limits mylimits --namespace=${namespace}
   kubectl delete quota compute-resources --namespace=${namespace}
   kubectl delete namespace  ${namespace}
   
  done
