from fastapi import FastAPI, Body, Request,Query
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
from pydantic import BaseModel
from starlette.middleware import Middleware
from starlette.middleware.cors import CORSMiddleware

middleware = [
    Middleware(
        CORSMiddleware,
        allow_origins=["http://localhost:3000"],
        allow_credentials=True,
        allow_methods=['GET','POST'],
        allow_headers=['*']
    )
]
app = FastAPI(title="Trading apps",middleware=middleware)

todos = [
    {
        "id": "1",
        "item": "Read a book."
    },
    {
        "id": "2",
        "item": "Cycle around town."
    }
]

@app.post("/todo")
async def add_todo(todo: dict) -> dict:
    todos.append(todo)
    return {
        "data": { "Todo added." }
    }

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

#class для формы логина
class Login_User(BaseModel):
    email: str="None"
    password: str="None"

#class для формы регистрации
class Signup_User(BaseModel):
    name: str="None"
    email: str="None"
    password: str="None"

#class для поиска парковки
class Search(BaseModel):
    search: str="None"

#class с информацией о парковке
class Parking_place(BaseModel):
    name: str="None"
    location: str="None"
    size: str="None"

#массив в котрый передаются данные о пользователях которые хотят зарегестрироваться
people_to_signup=[Signup_User(name="aaa",email="aboba@mail.ru",password="sussus")]
#массив с данными о парковках
parkings=[Parking_place(name="aboba",location="Ierusalim",size="4")]

#функция для поиска по email
def is_user(email):
    for a in people_to_signup:
        if a.email==email:
            return True
    return False

#функция для проверки правильности входа (пароль)
def is_user_r(email,password):
    for a in people_to_signup:
        if a.email==email:
            if a.password==password:
                return True
            return False
    return False

#функция для поиска парковок
def is_parkplace(search):
    for a in parkings:
        if a.name==search:
            return True
    return False

#форма регистрации
@app.post("/api/signup")
async def login_person(*,data:Signup_User):
    #тут я проверяю типо по email нету ли такго пользователя
    if is_user(data.email)==False:
        # сюда функцию добавление в базу данных данных нового пользователя
        ##---####
        person = Signup_User(name=data.name,email=data.email,password=data.password)
        people_to_signup.append(person)
        return{
            "SUCCESS":"SUCCESS",
            "data":data,
            "someshit" :people_to_signup
        }
    else:
        return{
            "FAILURE":"FAILURE",
        }

#форма входа
@app.post("/api/login")
async def login_person(*,data:Login_User):
    #person = Login_User(email=data.email,password=data.password)
    #тут я проверяю типо по email есть ли такой пользователь
    if( is_user_r(data.email,data.password)):
        return{
            "Yes":"Yes",
            "data":data,
            "someshit" :people_to_signup
        }
    else:
        return{
            "False":"False"
        }

#форма поиска
@app.post("/api/search")
async def search_parking(*,data:Search):
   #тут я проверяю типо по названию наличие парковки в базе
    if is_parkplace(data.search)==True:
        return{
            "status":"1",            
        }
    else:
        return{
            "status":"0",
        }
     
parkings=[
    {
        'id':'1',
        'city':'Perm',
        'street':'Plehanova 5',
        'latitude':'22727272727',
        'longitude':'88858585',
        'links_to_maps':'some_link1'
    },
    {
        
        'id':'2',
        'city':'Afganistan',
        'street':'Alach Ak Bar 13',
        'latitude':'22adds727272727',
        'longitude':'88dasdasd858585',
        'links_to_maps':'some_link2'
    }
]
#форма выгрузки всех парковок
@app.get("/api/home")
async def send_parkings():
    return parkings


if __name__ == "__main__":
    uvicorn.run("app.api:app", host="0.0.0.0", port=8000, reload=True)

#для запуска сервака в терминале нужно перейти в папку с этим файлом и написать
# python -m uvicorn main:app --reload --host 127.0.0.1 --port 8000
# побаловаться запросами можно на http://127.0.0.1:8000/docs