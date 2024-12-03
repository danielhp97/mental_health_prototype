FROM python:3.9-slim
WORKDIR backend

# Copy dependency files from the root
COPY ../pyproject.toml ./  

# Install Poetry and dependencies
RUN pip install poetry && poetry install --no-dev

# Copy all files from the backend directory into the container's /app directory
COPY . ./  

# Run the backend service
CMD ["poetry", "run", "python", "app.py"]