FROM python:3.10.11
WORKDIR /api
COPY . ./api
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "8000"]