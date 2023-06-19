from enum import Enum
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from usersDB import Management, Rights, Roles, Users
from parkingsDB import Cities, FreePlaces, Parkings, Regions, Streets
from users_parkings import UsersParkings

class ResStatus(Enum):
    SuccessRes=1
    UnsuccessRes=2

def PlaceReservation(d: dict, connection_string:str)->ResStatus:
    engine=create_engine(connection_string,echo=True)
    Session = sessionmaker(autoflush=False,bind=engine)
    with Session(autoflush=False,bind=engine) as db:
        db.add(UsersParkings(id_user=d['user_id'],id_parking=d['parking_id']))
        #countAvPlaces=db.query(FreePlaces.amount_free_places).filter(FreePlaces.id==d['parking_id'])
        countAvPlaces=db.query(FreePlaces.amount_free_places).select_from(FreePlaces
                                ).filter(FreePlaces.id==d['parking_id'])
        if (countAvPlaces.scalar()==0):
            return ResStatus.UnsuccessRes
        db.query(FreePlaces).filter(FreePlaces.id==d['parking_id']
                    ).update({"amount_free_places": FreePlaces.amount_free_places - 1})
        db.commit()
        db.close()
    return ResStatus.SuccessRes