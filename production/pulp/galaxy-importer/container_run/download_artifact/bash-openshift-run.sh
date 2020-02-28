echo 'Creating and running openshift job...'
echo 'apiVersion: batch/v1
kind: Job
metadata:
  name: quay-ans-test
spec:
  parallelism: 1
  completions: 1
  activeDeadlineSeconds: 1800 
  backoffLimit: 0
  template:
    metadata:
      name: quay-ans-test-metadata
    spec:
      containers:
      - name: quay-ans-test-container
        image: quay.io/awcrosby/ans-test-dl-archive
        env:
          - name: ARTIFACT_DOWNLOAD_URL
            value: http://e8101669.ngrok.io/api/automation-hub/v3/artifacts/collections/awcrosby.collection_test.1.0.21
        # command: ["/bin/sh","-c"]
        # args: ["pwd; cd /ansible_collections; curl http://e8101669.ngrok.io/api/automation-hub/v3/artifacts/collections/awcrosby.collection_test.1.0.11 --output test.txt; pwd; ls"]
      restartPolicy: Never
' >> job.yaml
oc create -f job.yaml
rm job.yaml

sleep 5

echo 'Getting logs from job'
oc logs jobs/quay-ans-test -f

echo 'Deleting files...'
oc delete job/quay-ans-test
