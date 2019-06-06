Scripts usage
=============
* Test the EKS cluster

```
$ ./test
```

* Load the KUBECONFIG environment variable

```
$ . ./kubeconfig
$ echo $KUBECONFIG
$ kubectl get nodes
```

* Get the EKS Instance Profile ARN and Role name

```
$ ./get-instance-profile-arn-role-name | . -
$ echo $ROLE_NAME
$ echo $INSTANCE_PROFILE_ARN
```
