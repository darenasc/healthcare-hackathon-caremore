# Healthcare Hackathon Caremore

CareMore System - ProductForge Digital Healthcare Hackathon 2020.

(This is a mockup project)

![](./docs/images/CareMoreLogo.png)

## The CareMore database

Can be started in Docker.

`docker run --name caremore -h caremore -p 5432:5432 -itd -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=caremore -e POSTGRES_DB=caremore postgres:10`

* The database can be created with this [SQL script](./code/create_database.sql). Tested for PostgreSQL v10.
* [Dummy data](./code/dummy_data.sql) can be loaded to test the app.

## The CareMore Python library

* The library is on the [`caremore.py`](./code/caremore.py)
* An example can be found in this [notebook](./code/CareMore.ipynb).

```
Welcome, what is your login?: 
Welcome PersonX

Hi PersonX
Your Next Appointment
GP Appointment
2020-02-24 
04:15 PM
10 Bowmont Pl Edinburgh

This week`s bonus
Sausage Roll from Greggs
```