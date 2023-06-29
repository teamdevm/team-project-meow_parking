FROM python:3.10.12-slim

ENV PYTHONUNBUFFERED 1

RUN mkdir /app
COPY . /app

WORKDIR /app/

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "--host", "0.0.0.0", "main:app"]
