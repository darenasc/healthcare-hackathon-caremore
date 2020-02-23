# Healthcare Hackathon Caremore

CareMore System - ProductForge Digital Healthcare Hackathon 2020.

(This is a mockup project)

![](./docs/images/CareMoreLogo.png)

## The CareMore database

Can be started in Docker.

`docker run --name caremore -h caremore -p 5432:5432 -itd -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=caremore -e POSTGRES_DB=caremore postgres:10`

## The CareMore Python library

* The library is on the [`caremore.py`](./code/caremore.py)
* An example can be found in this [notebook](./code/CareMore.ipynb).
