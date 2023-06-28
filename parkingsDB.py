from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import DeclarativeBase
from sqlalchemy.orm import Session
from sqlalchemy import  Column, Integer, String, VARCHAR

#parkingsString = "postgres://postgres:postgres@localhost:5432/parking_information"

#engineParkings = create_engine('postgresql+psycopg2://postgres:postgres@localhost:5432/parking_information', echo=True)
#engineParkings.connect()

# sessionParkings = sessionmaker(autoflush=False, bind=engineParkings)

# создаем модель, объекты которой будут храниться в бд
class Base(DeclarativeBase): pass
class Cities(Base):
    __tablename__ = "cities"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(VARCHAR)
    region = Column(Integer)
class FreePlaces(Base):
    __tablename__ = "free_places_count"
    id = Column(Integer, primary_key=True, index=True)
    id_parking = Column(Integer)
    amount_free_places = Column(Integer)
class Parkings(Base):
    __tablename__ = "parkings"
    id_p = Column(Integer, primary_key=True, index=True)
    city = Column(Integer)
    street = Column(Integer)
    latitude = Column(VARCHAR)
    longitude = Column(VARCHAR)
    link_to_maps = Column(VARCHAR)
class Regions(Base):
    __tablename__ = "regions"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(VARCHAR)
class Streets(Base):
    __tablename__ = "streets"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(VARCHAR)
    city = Column(Integer)


