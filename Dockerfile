FROM python:3.11

# Install uv.
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy the application into the container.
COPY . /app/

# Install the application dependencies.
WORKDIR /app
RUN uv sync --frozen --no-cache

# Run the application.
CMD [".venv/bin/fastapi", "run", "main.py", "--port", "8000", "--host", "0.0.0.0"]
