FROM python:3.9-slim
WORKDIR /app

# Copy shared files from the root
COPY ../pyproject.toml ../poetry.lock ./  

# Install Poetry and dependencies
RUN pip install poetry && poetry install --no-dev

# Copy auth-specific code
COPY . ./

# Run the auth service
CMD ["poetry", "run", "python", "auth_service.py"]