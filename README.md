# zappa-docker-env
Python 3.6 Image used for building and deploying flask apps in AWS Lambda using Zappa

[![Docker Stars](https://img.shields.io/docker/stars/crouffer/zappa-build-env.svg?style=flat-square)](https://hub.docker.com/r/crouffer/zappa-build-env/)

[![Docker Pulls](https://img.shields.io/docker/pulls/crouffer/zappa-build-env.svg?style=flat-square)](https://hub.docker.com/r/crouffer/zappa-build-env/)

[![Latest Image Tag](https://images.microbadger.com/badges/version/crouffer/zappa-build-env.svg)](https://microbadger.com/images/crouffer/zappa-build-env "Get your own version badge on microbadger.com")




# Testing the Flask App locally
```bash
docker run -v `pwd`/zappa-example/:/code -w /code -p 80:80 -it crouffer/zappa-build-env:1.2
python3 -m venv ./venv
source venv/bin/activate
pip install -r requirements.txt
python3 app.py
```

From your web browser, navigate to [http://localhost:80](http://localhost:80/)

# Deploying and testing on Lambda
## Prepare the virtual environment
```bash
docker run -v `pwd`/zappa-example/:/code -w /code -p 80:80 -e AWS_ACCESS_KEY_ID=<your_aws_access_key> -e AWS_SECRET_ACCESS_KEY=<aws_secret_access_key> -it crouffer/zappa-build-env:1.2
source venv/bin/activate
pip install -r requirements.txt
```
## Initialize the Zappa project
```bash
zappa init
```
Chose the default values, or customize as desired

## Deploy the Application to Lambda
```bash
zappa deploy dev
```
When the deploy is complete you should see something resembling:
```bash
Waiting for stack zappa-build-env-example-dev to create (this can take a bit)..
 75%|████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▌                                         | 3/4 [00:06<00:02,  2.68s/res]
Deploying API Gateway..
Deployment complete!: https://abcd1234.execute-api.us-east-2.amazonaws.com/dev
```
Copy the url (i.e. https://abcd1234.execute-api.us-east-2.amazonaws.com/dev) and try it in a browser


