# K8 works with API versions to declare the resources

# YML is case sensitive -indentation of YML is important
# use spaces, not a tab
apiVersion: apps/v1
kind: Deployment # what kind of service/object you want to create

# what would you like to call it
metadata:
  name: api-deployment # naming the deployment

spec:
  selector:
    matchLabels:
      app: api # look for this label to match with k8 service
  
  # Let's create a replica set of this with 2 instaces/pods
  replicas: 3 

  # template to use it's label for K8 service to launch in the browser
  template:
    metadata:
      labels:
        app: api # this label connects to the service or any other k8 components
    
    # Let's define the container spec
    spec:
      containers:
      - name: api
        image: tomasdat/105_api_project
        ports:
        - containerPort: 82