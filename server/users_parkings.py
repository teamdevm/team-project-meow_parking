from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import DeclarativeBase
from sqlalchemy.orm import Session
from sqlalchemy import  Column, Integer, String, VARCHAR

class Base(DeclarativeBase): pass
class UsersParkings(Base):
    __tablename__="users_parkings"
    id = Column(Integer, primary_key=True, index=True)
    id_parking = Column(Integer)
    id_user=Column(Integer)
