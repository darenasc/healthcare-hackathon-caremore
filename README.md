# healthcare-hackathon-caremore
CareMore System - ProductForge Digital Healthcare Hackathon

(This is a mockup project)

![](./docs/images/CareMoreLogo.png)

## The CareMore database

Can be started in Docker.

`docker run --name caremore -h caremore -p 5432:5432 -itd -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=caremore -e POSTGRES_DB=caremore postgres:10`

## The CareMore Python library

