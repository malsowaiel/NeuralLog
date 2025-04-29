FROM python:3.7-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt update && apt install vim -y

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . /app/

# Set working directory to iris example
WORKDIR /app/examples/iris

# Make run.sh executable
RUN chmod +x run.sh

# Create a directory for data
RUN mkdir -p data

# Default command
CMD ["./run.sh"]
