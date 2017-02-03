echo $1
nodeport=`kubectl get service tomcat-service -o yaml --namespace=$1| grep nodePort`
MASTER_IP=0.0.0.0
NODEPORT=`sed -e 's#.* \(\)#\1#' <<< ${nodeport}`
echo $NODEPORT
echo 1000x1000 calls >> run_$1 
date >> run_$1 
for a in `seq 1000`
  do for j in `seq 1000`  
     do
     curl  -w "@curl-format.txt" -o /dev/null -s ${MASTER_IP}:${NODEPORT}  >> run_tomcat-$1.csv
  done 
done 
date >> run_$1
