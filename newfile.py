
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
import usersDB
import src.auth as auth
from src.reg import exportUsers,Registration,RegStatus
from src.auth import authorize,AuthStatus
from src.ResPlace import PlaceReservation,ResStatus,FreeingUpParkingPlace
from src.search import CheckUserParkingPlaces,export

usersString = 'postgresql+psycopg2://postgres:postgres@localhost:5432/parking_information'

engineUsers = create_engine(usersString, echo=True)
connection_string = engineUsers.connect()

sessionUsers = sessionmaker(autoflush=False, bind=engineUsers)
print(len(CheckUserParkingPlaces({"user_id":12},usersString)))
# print(export(usersString))
