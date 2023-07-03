FROM python:3.10.12-slim

ENV PYTHONUNBUFFERED 1

WORKDIR /api
COPY . /api/

RUN pip install -r requirements.txt

EXPOSE 8000


CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
