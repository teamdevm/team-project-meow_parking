from fastapi import FastAPI, Body, Request
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import DeclarativeBase
from sqlalchemy.orm import Session
from sqlalchemy import  Column, Integer, String, VARCHAR
from pydantic import *
from typing import List
import uvicorn
from fastapi.middleware.cors import CORSMiddleware
#import parkingDB

app = FastAPI(title="Trading apps")

origins = [
    "http://localhost:8000",
    "localhost:8000"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

@app.get("/")
def hello():
    return "вова привет"

@app.get("/items")
def hello(data = Body()):
    name = data["name"]
    age = data["age"]
    print(name)
    return {"message": f"{name}, ваш возраст - {age}"}

fake_users = [{"id": 1, "role": "aboba", "name": "mmm"}, {"id": 2, "role": "2aboba", "name": "2mmm"}]

fake_trades = [{"id": 1, "user_id": 1, "currency": "mmm"}, {"id": 2, "user_id": 2, "name": "2mmm"}]

@app.get("/api/users/{user_id}")
def get_user(user_id: int):
    return [user for user in fake_users if user.get("id") == user_id]

class Trade(BaseModel):
    id: int
    user_id: int
    currency: str

@app.post("/trades")
def add_trades(trades: List[Trade]):
    fake_trades.extend(trades)
    return{"status": 200, "data":fake_trades}

@app.post("/reg")
def add_regi(name, email, passw):
    print(name, email, passw)
    return{"name": name, "email":email, "passw":passw}


#для запуска сервака в терминале нужно перейти в папку с этим файлом и написать
# python -m uvicorn main:app --reload --host 127.0.0.1 --port 8000
# побаловаться запросами можно на http://127.0.0.1:8000/docs