# Mage AI Data Engineering Project

A containerized data engineering platform built with [Mage AI](https://www.mage.ai/) for building, deploying, and monitoring data pipelines.

## 🚀 Features

- **Data Pipeline Development**: Create ETL/ELT pipelines using Python, SQL, and R
- **Interactive Notebooks**: Jupyter-style notebooks for data exploration and transformation
- **Scheduling**: Built-in scheduling for automated pipeline execution
- **Monitoring**: Real-time pipeline monitoring and alerting
- **Version Control**: Git integration for pipeline versioning
- **Containerized**: Docker-based deployment for consistency across environments
- **PostgreSQL Database**: Persistent data storage with health checks

## 📋 Prerequisites

Before running this project, ensure you have the following installed:

- **Docker** (version 20.10 or higher)
- **Docker Compose** (version 2.0 or higher)
- **Git** (for version control)

### System Requirements

- **RAM**: Minimum 4GB, Recommended 8GB+
- **Storage**: At least 10GB free space
- **CPU**: 2+ cores recommended

## 🛠️ Installation & Setup

### 1. Clone the Repository

```bash
git clone <your-repository-url>
cd mageai_project
```

### 2. Environment Configuration

1. Copy the environment example file:
   ```bash
   cp env.example .env
   ```

2. Edit the `.env` file with your configuration:
   ```bash
   # Required: Update these values
   MAGE_DB_PASSWORD=your_secure_password_here
   DEFAULT_OWNER_PASSWORD=your_admin_password_here
   JWT_SECRET=your_jwt_secret_here_make_it_long_and_random
   
   # Optional: Customize other settings as needed
   CONTAINER_NAME=your_project_name
   MAGE_PORT=6789
   ```

### 3. Create Docker Network

Create the required Docker network:

```bash
docker network create mage_connection
```

### 4. Build and Start Services

```bash
# Build and start all services
docker-compose up -d

# Or build and start with logs
docker-compose up --build
```

### 5. Verify Installation

1. Check if services are running:
   ```bash
   docker-compose ps
   ```

2. Check service logs:
   ```bash
   docker-compose logs mage
   docker-compose logs mage_db
   ```

3. Access Mage AI:
   - Open your browser and navigate to: `http://localhost:6789`
   - Login with the credentials specified in your `.env` file

## 🔧 Configuration

### Environment Variables

The following environment variables can be configured in your `.env` file:

#### Required Variables
- `CONTAINER_NAME`: Name prefix for Docker containers
- `PROJECT_NAME`: Name of your Mage project (default: analytics_project)
- `MAGE_PORT`: Port for the Mage AI web interface (default: 6789)
- `MAGE_DB_PASSWORD`: PostgreSQL database password
- `DEFAULT_OWNER_PASSWORD`: Admin user password
- `JWT_SECRET`: Secret key for JWT authentication

#### Database Configuration
- `MAGE_DB_NAME`: Database name (default: mage_db)
- `MAGE_DB_USER`: Database user (default: mage_user)
- `MAGE_DB_SCHEMA`: Database schema (default: mage)
- `MAGE_DB_PORT`: Database port (default: 5432)

#### Performance Settings
- `CONCURRENCY_CONFIG_BLOCK_RUN_LIMIT`: Maximum concurrent block executions (default: 10)
- `CONCURRENCY_CONFIG_PIPELINE_RUN_LIMIT`: Maximum concurrent pipeline executions (default: 5)
- `ULIMIT_NO_FILE`: File descriptor limit (default: 65536)

### Project Structure

```
mageai_project/
├── analytics_project/          # Your Mage AI project directory
│   ├── pipelines/             # Data pipelines
│   ├── transformers/          # Data transformation blocks
│   ├── data_loaders/          # Data loading blocks
│   ├── data_exporters/        # Data exporting blocks
│   ├── utils/                 # Utility functions
│   └── charts/                # Custom charts
├── docker-compose.yaml        # Docker Compose configuration
├── Dockerfile                 # Custom Docker image
├── requirements.txt           # Python dependencies
├── .env                       # Environment variables (create from env.example)
├── env.example               # Environment variables template
├── .gitignore                # Git ignore rules
├── .dockerignore             # Docker ignore rules
└── README.md                 # This file
```

## 🚀 Usage

### Starting the Application

```bash
# Start all services
docker-compose up -d

# Start with logs
docker-compose up

# Start specific service
docker-compose up mage
```

### Stopping the Application

```bash
# Stop all services
docker-compose down

# Stop and remove volumes (⚠️ This will delete all data)
docker-compose down -v
```

### Viewing Logs

```bash
# View all logs
docker-compose logs

# View specific service logs
docker-compose logs mage
docker-compose logs mage_db

# Follow logs in real-time
docker-compose logs -f mage
```

### Accessing the Database

```bash
# Connect to PostgreSQL database
docker-compose exec mage_db psql -U mage_user -d mage_db

# Or use a database client with these credentials:
# Host: localhost
# Port: 5432 (or MAGE_DB_PORT from .env)
# Database: mage_db
# Username: mage_user
# Password: (MAGE_DB_PASSWORD from .env)
```

## 🔍 Troubleshooting

### Common Issues

#### 1. Port Already in Use
If you get a port conflict error:
```bash
# Check what's using the port
lsof -i :6789

# Change the port in .env file
MAGE_PORT=6788
```

#### 2. Database Connection Issues
If the database isn't starting:
```bash
# Check database logs
docker-compose logs mage_db

# Restart database service
docker-compose restart mage_db
```

#### 3. Permission Issues
If you encounter permission issues:
```bash
# Fix file permissions
sudo chown -R $USER:$USER .

# Or run with sudo (not recommended for production)
sudo docker-compose up -d
```

#### 4. Memory Issues
If the application is slow or crashes:
- Increase Docker memory allocation
- Reduce concurrency limits in `.env`
- Check system resources: `docker stats`

## 🔒 Security Considerations

1. **Change Default Passwords**: Always change the default passwords in `.env`
2. **Secure JWT Secret**: Use a strong, random JWT secret
3. **Network Security**: The application runs on a custom Docker network
4. **Environment Variables**: Never commit `.env` files to version control
5. **Database Security**: Use strong database passwords and consider external database for production

## 📚 Additional Resources

- [Mage AI Documentation](https://docs.mage.ai/)
- [Docker Documentation](https://docs.docker.com/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)

## 🆘 Support

If you encounter any issues:

1. Check the troubleshooting section above
2. Review the logs: `docker-compose logs`
3. Check the [Mage AI documentation](https://docs.mage.ai/)
4. Create an issue in the repository

---

**Note**: This is a development setup. For production deployment, consider additional security measures, monitoring, and backup strategies.