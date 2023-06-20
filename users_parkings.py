from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import DeclarativeBase
from sqlalchemy.orm import Session
from sqlalchemy import  Column, Integer, String, VARCHAR

#parkingsString = "postgres://postgres:postgres@localhost:5432/parking_information"

#engineParkings = create_engine('postgresql+psycopg2://postgres:postgres@localhost:5432/parking_information', echo=True)
#engineParkings.connect()

class Base(DeclarativeBase): pass
class UsersParkings(Base):
    __tablename__="users_parkings"
    id = Column(Integer, primary_key=True, index=True)
    id_parking = Column(Integer)
    id_user=Column(Integer)