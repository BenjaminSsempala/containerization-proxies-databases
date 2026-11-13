# Part 3: Multi-container app on EC2 (Flask + MySQL)

## Layout

```
03-multi-container-ec2/
├── docker-compose.yml   # services: web, db
├── .env.example         # DB settings (copy to .env)
├── web/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
└── db/
    └── init.sql
```

## EC2 setup
<!-- TODO: instance type, AMI, security group, how Docker + Compose were installed -->

## Run
<!-- TODO -->

## Verify
<!-- TODO: `curl http://localhost:5000` output -->

## Cleanup
<!-- TODO: `docker compose down --volumes` output -->
