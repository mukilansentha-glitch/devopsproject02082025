FROM python:3.11-slim

WORKDIR /code

COPY requirements.txt /code/

RUN pip install --upgrade pip setuptools wheel \
    && pip install --no-cache-dir -r requirements.txt

COPY . /code

EXPOSE 5000

CMD ["python", "app.py"]
