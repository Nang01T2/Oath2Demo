## Setup and start ORY HYDRA authentication server via Docker

Need to have [Docker](https://www.docker.com/get-started) installed.
Open the terminal, then executes the below commands:

>$ docker pull oryd/hydra:v1.0.0-beta.9

>$ docker run -it --rm --name hydra-example -p 4444:4444 -p 4445:4445 \
    -e OAUTH2_SHARE_ERROR_DEBUG=1 \
    -e LOG_LEVEL=debug \
    -e OAUTH2_CONSENT_URL=http://localhost:8080/auth/consent \
    -e OAUTH2_LOGIN_URL=http://localhost:8080/auth/login \
    -e OAUTH2_ISSUER_URL=http://localhost:4444 \
    -e DATABASE_URL=memory \
    oryd/hydra:v1.0.0-beta.9 serve all --dangerous-force-http
    
>$ docker run --link hydra-example:hydra oryd/hydra:v1.0.0-beta.9 clients create \
    --endpoint http://hydra:4445 \
    --id test-client \
    --secret test-secret \
    --response-types code,id_token \
    --grant-types refresh_token,authorization_code \
    --scope openid,offline \
    --callbacks com.example-app:/oauth2/callback
    
## Start Vapor backend
Run the following command to install the latest version of Vapor:
>brew install vapor/tap/vapor

Open and run the auth-tutorial-api project

## Run the client sample
Open and run the auth-tutorial-ios project
