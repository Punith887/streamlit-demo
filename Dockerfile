FROM python:3.11-slim

WORKDIR /app

# Prevent Python from writing .pyc files & enable clean stdout/stderr logs
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source code
COPY . .

# Render exposes the PORT variable; default to 8501 for local testing
ENV PORT=8501
EXPOSE $PORT

# Start Streamlit binding to 0.0.0.0 and the PORT environment variable
CMD streamlit run app.py --server.port=$PORT --server.address=0.0.0.0 --server.enableCORS=false --server.enableXsrfProtection=false