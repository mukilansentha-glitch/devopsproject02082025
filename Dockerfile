FROM python:3.11-slim

WORKDIR /code

# install system dependencies + rust
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    rustc \
    cargo \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /code/

RUN pip install --upgrade pip setuptools wheel \
    && pip install --no-cache-dir -r requirements.txt

COPY . /code

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
