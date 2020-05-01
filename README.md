# TwitterPolite

Twitter followback bot designed to run as a cronjob in a container.  

## config.json

`"Consumer_Key": "string"`  
`"Consumer_Secret": "string"`  
`"Access_Token": "string"`  
`"Access_Token_Secret": "string"`   
`"FollowsPerRun": int`  

## Docker
```
docker run --rm -it \
                  -e CONSUMER_KEY=XXXX \
                  -e CONSUMER_SECRET=XXXX \
                  -e ACCESS_TOKEN=XXXX \
                  -e ACCESS_TOKEN_SECRET=XXX \
                  -e FOLLOW_PER_RUN=10 \
                  chn2guevara/twitterpolite:latest
```
