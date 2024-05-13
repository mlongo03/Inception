# Inception: Docker Containerization Project

## Overview
Inception is a comprehensive Docker containerization project designed to masterize knowledge about containerization and its practical application in real-world projects. The project consists of seven containers, each serving a specific purpose and built from scratch without relying on existing images. By containerizing various services, Inception offers flexibility, scalability, and ease of deployment.

## Key Features
- Utilizes Docker for containerization.
- Infrastructure orchestrated via Docker Compose.
- Secure storage of credentials and sensitive data using environment variables and a `.env` file.
- Inter-container communication facilitated through Docker networks.

## Containers

1. **Wordpress**:
    - Connects to MariaDB server for database operations.
    - Accessible at `https://<your_username>.42.fr:443`.

2. **MariaDB**:
    - Provides database services for Wordpress.
    
3. **Nginx**:
    - Acts as a reverse proxy.
    - Exposes port 443 to host machine.
    - Routes requests to respective services.

4. **Adminer**:
    - Web-based database management tool.
    - Accessible at `https://<domain_name>/adminer`.

5. **cAdvisor**:
    - Analyzes resource usage and performance characteristics of containers.
    - Accessible at `http://localhost:8080`.

6. **FTP**:
    - Enables file transfer using FTP protocol.
    - Requires the FTP server's IP address for connection.

7. **Static Website**:
    - Portfolio website accessible at `<domain_name>/website`.

## Setup Instructions
1. Clone the repository.
2. go inside the repository.
3. Run make on terminal.
make will initially create a dummy .env file with random credentials for containers, you have to edit with your credentials, then
it will creates folders needed from the containers on the host machine in order to create volumes and finally it will run
docker-compose up to actually create and start containers
## Additional Notes
- To find the IP address of the FTP server, run `make ipaddress` in the terminal.
- Ensure proper network configurations for inter-container communication.
- For accessing services, use designated URLs and ports as specified above.

Inception offers a versatile containerization solution for deploying various services with ease and efficiency. Enjoy exploring and utilizing the power of Docker!
