from sqlmodel import create_engine, SQLModel
from sqlalchemy.exc import OperationalError
import time


# Replace localhost with the service name of the database container in docker-compose.yml
EXPOSED_PORT = 5432
USER = "user"
PASSWORD = "password"
HOST = "database"

# PostgreSQL database URL
DATABASE_URL = f"postgresql://{USER}:{PASSWORD}@{HOST}:{EXPOSED_PORT}/management"

# Create the database engine
engine = create_engine(DATABASE_URL, echo=True)

# Function to create database tables
def create_db_and_tables():
    SQLModel.metadata.create_all(engine)

# Retry mechanism for database initialization
def create_db_and_tables_with_retry():
    retries = 10  # Number of retry attempts
    while retries > 0:
        try:
            create_db_and_tables()  # Attempt to create tables
            print("✅ Database connected and tables created successfully.")
            break
        except OperationalError:
            retries -= 1
            print(f"❌ Database not ready. Retrying in 5 seconds... ({retries} retries left)")
            time.sleep(5)  # Wait before retrying

    if retries == 0:
        raise RuntimeError("Failed to connect to the database after multiple retries.")