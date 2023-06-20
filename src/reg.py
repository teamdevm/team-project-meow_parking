import hashlib
from enum import Enum
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from usersDB import Management, Rights, Roles, Users

# authorize status
class RegStatus(Enum):
    NewUser=1
    ExistMail=2

def exportUsers(connection_string : str) -> list[str, int]:
    engineParkings = create_engine(connection_string, echo=True)
    engineParkings.connect()

    sessionParkings = sessionmaker(autoflush=False, bind=engineParkings)
    res = []
    with sessionParkings(autoflush=False, bind=engineParkings) as db:
        strJoin = db.query(Users.email, Users.password, Roles.role_name).select_from(Users).join(Roles, Users.role==Roles.id)
        for sj in strJoin:
            res.append((sj.email, sj.role_name))
    return res

def Registration(d, connection_string):
    given = d['email']
    data = exportUsers(connection_string)
    if given in [i[0] for i in data]:
        return RegStatus.ExistMail
    

    hashed=hashlib.md5((d['password']+given).encode()).hexdigest()

    engine = create_engine(connection_string, echo=True)
    Session = sessionmaker(bind=engine)
    session = Session()
    session.add(
        Users(surname=' ', name=d['name'], fathername=' ', email=given, ph_number=' ', role=1, password=hashed)
    )
    session.commit()
    session.close()
    return RegStatus.NewUser

if __name__=='__main__':
    pass