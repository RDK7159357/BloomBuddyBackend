# Use Python 3.10 slim image for better compatibility
FROM python:3.10.15-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies using only pre-compiled wheels
RUN pip install --no-cache-dir --only-binary=all -r requirements.txt

# Copy the rest of the application
COPY . .

# Expose the port
EXPOSE 5000

# Run the application
CMD ["python", "ml-api-server.py"]
