
# Stage 1: Build dependencies using Python on Debian
FROM python:3.13-slim-trixie AS builder

WORKDIR /app

# Create a virtual environment
RUN ln -s /usr/local/bin/python /usr/bin/python && \
    python -m venv /venv

# Install Python dependencies
COPY requirements.txt .
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt

# Stage 2: Minimal Distroless runtime
FROM gcr.io/distroless/python3-debian13:latest

LABEL created_by="Sriram Setti"

WORKDIR /app

# Copy installed dependencies
COPY --from=builder /venv /venv

# Copy application
COPY hello.py .

# Application port
EXPOSE 8021

# Run Python application
CMD ["/venv/bin/python", "hello.py"]