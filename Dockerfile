FROM python:3.10.11

ENV PYTHONUNBUFFERED 1

WORKDIR /api
COPY . /api/

RUN apt update && apt install -y python3-pip
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "8000"]
