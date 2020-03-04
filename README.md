# db-rhamt-demo-bucketrepo

```
oc new-project dev-tools

oc new-app quay.io/aclark/db-demo-bucketrepo --name=bucketrepo -n dev-tools

oc expose dc/bucketrepo --port=80 --target-port=8080 -n dev-tools
```
