from fastapi import FastAPI
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import DeclarativeBase
from sqlalchemy.orm import Session
from sqlalchemy import  Column, Integer, String, VARCHAR
#import parkingDB

app = FastAPI()

#@app.get("/")
#def root():
#    data = {"message": "Hello METANIT.COM"}
 #   json_data = jsonable_encoder(data)
 #   return JSONResponse(content=json_data)
app = FastAPI()

class GraphBase(BaseModel):
    start: str
    end: str
    distance: int

class GraphList(BaseModel):
    data: List[GraphBase]

@app.post("/")
async def get_body(data: GraphList):
    return data



