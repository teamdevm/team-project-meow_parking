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


# https://github.com/tiangolo/fastapi/issues/1663?ysclid=lj1vbqccwx576726578#issuecomment-816027750

def check_routes(request: Request):
        # Using FastAPI instance
        url_list = [
            route.path
            for route in request.app.routes
            if "rest_of_path" not in route.path
        ]
        if request.url.path not in url_list:
            return JSONResponse({"detail": "Not Found"}, status.HTTP_404_NOT_FOUND)
        
# Handle CORS preflight requests
@app.options("/{rest_of_path:path}")
async def preflight_handler(request: Request, rest_of_path: str) -> Response:
        response = check_routes(request)
        if response:
            return response

        response = Response(
            content="OK",
            media_type="text/plain",
            headers={
                "Access-Control-Allow-Origin": ALLOWED_ORIGINS,
                "Access-Control-Allow-Methods": ALLOWED_METHODS,
                "Access-Control-Allow-Headers": ALLOWED_HEADERS,
            },
        )
        return response

    # Add CORS headers
@app.middleware("http")
async def add_cors_header(request: Request, call_next):
        response = check_routes(request)
        if response:
            return response

        response = await call_next(request)
        response.headers["Access-Control-Allow-Origin"] = ALLOWED_ORIGINS
        response.headers["Access-Control-Allow-Methods"] = ALLOWED_METHODS
        response.headers["Access-Control-Allow-Headers"] = ALLOWED_HEADERS
        return response


#app = FastAPI(title="Trading apps")

#app=CORSMiddleware(
#    app=app,
##    allow_credentials=True,
#    allow_methods=['GET','POST'],
#    allow_headers=['Content-Type','application/json']
#)

#app.add_middleware(
#    CORSMiddleware,
#    allow_origins=["http://localhost:3000"],
#    allow_credentials=True,
##    allow_methods=['GET','POST'],
#   allow_headers=['Content-Type','application/json']
#)

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


class User(BaseModel):
    email: str
    password: str


@app.post('/log')
async def main(request: Request): 
    return await request.json()

@app.get('/log')
def hello():
    return "вова привет"

#def main(user: User):
#    return user

if __name__ == "__main__":
    uvicorn.run("app.api:app", host="0.0.0.0", port=8000, reload=True)

#для запуска сервака в терминале нужно перейти в папку с этим файлом и написать
# python -m uvicorn main:app --reload --host 127.0.0.1 --port 3000
# побаловаться запросами можно на http://127.0.0.1:3000/docs