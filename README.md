# AWS-EC2-Region-Latency-Simulator

This project is a simulator designed for network testing based on the latency caused by regional distances between AWS EC2 instances. The regions included in this project are California, Singapore, and Tokyo. The latency standards were referenced from [CloudPing](https://www.cloudping.co/grid). The simulator is built on Docker networks, allowing users to connect to containers and check the latency between them, as demonstrated in the example below.

## Description

This project simulates network latency between AWS EC2 instances across different regions:

- **Regions Covered**: California, Singapore, and Tokyo
- **Latency Standards**: Based on data from [CloudPing](https://www.cloudping.co/grid)

The setup uses Docker to create a network environment where you can observe and test the latency between containers, mimicking the real-world distances and latencies between AWS regions.

## Usage

1. **Start the Docker containers**:
   - Use the provided `docker-compose.yml` to spin up the containers.
   
2. **Access the containers**:
   - Connect to any of the running containers using `docker exec -it <container_name> /bin/bash`.

3. **Test Latency**:
   - Use network tools like `ping` to check the latency between the containers.

## Example

To connect to a container and test latency, follow these steps:

```sh
# Start the Docker containers
docker-compose up -d

# Connect to a container
docker exec -it california1 /bin/bash

# Test latency to another container
ping 172.18.0.67  # Example IP of another container
```

This setup helps in understanding the impact of regional latency on network performance between AWS EC2 instances, providing a controlled environment for testing and analysis.