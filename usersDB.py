from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import DeclarativeBase
from sqlalchemy.orm import Session
from sqlalchemy import  Column, Integer, String, VARCHAR

usersString = "postgres://postgres:postgres@localhost:5432/users_roles_parking"

engineUsers = create_engine('postgresql+psycopg2://postgres:postgres@localhost:5432/users_roles_parking', echo=True)
engineUsers.connect()

sessionUsers = sessionmaker(autoflush=False, bind=engineUsers)

# создаем модель, объекты которой будут храниться в бд
class Base(DeclarativeBase): pass
class Management(Base):
    __tablename__ = "parking_management"
    id = Column(Integer, primary_key=True, index=True)
    id_admin = Column(Integer)
    id_parking = Column(Integer)
class Rights(Base):
    __tablename__ = "rights"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(VARCHAR)
    allowed_to = Column(VARCHAR)
class Roles(Base):
    __tablename__ = "roles"
    id = Column(Integer, primary_key=True, index=True)
    role_name = Column(VARCHAR)
    rights = Column(Integer)
class Users(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    surname = Column(VARCHAR)
    name = Column(VARCHAR)
    fathername = Column(VARCHAR)
    email = Column(VARCHAR)
    ph_number = Column(VARCHAR)
    role = (Integer)
    password = Column(VARCHAR)




