# Containerization, Proxies and Databases

AmaliTech DevOps lab, in three parts:

| Part | Folder | What it covers |
|---|---|---|
| 1 | [`01-dockerfile/`](01-dockerfile/) | Packaging a Flask app into a Docker image and running it |
| 2 | [`02-nginx-proxy/`](02-nginx-proxy/) | Putting an Nginx reverse proxy in front of the Flask app |
| 3 | [`03-multi-container-ec2/`](03-multi-container-ec2/) | Deploying a Flask + MySQL app on EC2 with Docker Compose |

Screenshots for each part are in [`screenshots/`](screenshots/).

## Tools

Versions on the EC2 instance (the lab requires Docker v25+ and Docker Compose v2+):

```
Docker version 25.0.14, build 0bab007
Docker Compose version v5.8.0
```

Part 3 also uses Terraform and Ansible to create the EC2 instance and deploy the app.

## Status

- [x] Part 1: Dockerfile
- [x] Part 2: Nginx reverse proxy
- [x] Part 3: Multi-container app on EC2
