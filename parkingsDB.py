from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import DeclarativeBase
from sqlalchemy.orm import Session
from sqlalchemy import  Column, Integer, String, VARCHAR

# parkingsString = "postgres://postgres:postgres@localhost:5432/postgres"

# engineParkings = create_engine('postgresql+psycopg2://postgres:postgres@localhost:5432/postgres', echo=True)
# engineParkings.connect()

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
    id = Column(Integer, primary_key=True, index=True)
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


# создаем сессию подключения к бд
# with sessionParkings(autoflush=False, bind=engineParkings) as db:
#     ### CREATE data ####
#     street0 = Streets(name = "Студенческая", city = 1)
#     db.add(street0)
#     db.commit()

#     ### READ data ####
#     cities = db.query(Cities).all()
#     freePlaces = db.query(FreePlaces).all()
#     parkings = db.query(Parkings).all()
#     region = db.query(Regions).all()
#     streets = db.query(Streets).all()

#     for c in cities:
#         print(f"{c.id} {c.name} {c.region}")
#     for f in freePlaces:
#         print(f"{f.id} {f.id_parking} {f.amount_free_places}")
#     for p in parkings:
#         print(f"{p.id} {p.city} {p.street} {p.latitude} {p.longitude} {p.link_to_maps}")
#     for r in region:
#         print(f"{r.id} {r.name}")
#     for s in streets:
#         print(f"{s.id} {s.name} {s.city}")

#     ### UPDATE data ####
#     streets1 = db.query(Streets).filter(Streets.id==1).first()
#     streets1.name = "ПУШКИНА"
#     db.commit()
#     streets1 = db.query(Streets).filter(Streets.id==1).first()
#     print(f"{streets1.id} {streets1.name} {streets1.city}")

#     ### DELETE data ####
#     streetD = db.query(Streets).filter(Streets.name=="Студенческая").first()
#     db.delete(streetD)
#     db.commit()
