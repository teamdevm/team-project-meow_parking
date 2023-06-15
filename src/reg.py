import hashlib
from enum import Enum
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from usersDB import Management, Rights, Roles, Users

# authorize status
class RegStatus(Enum):
    NewUser=1
    ExistMail=2

def exportUsers(connection_string : str) -> list[str, str, str]:
    engineParkings = create_engine(connection_string, echo=True)
    engineParkings.connect()

    sessionParkings = sessionmaker(autoflush=False, bind=engineParkings)
    res = []
    with sessionParkings(autoflush=False, bind=engineParkings) as db:
        strJoin = db.query(Users.email, Users.password, Roles.role_name).select_from(Users).join(Roles, Users.role==Roles.id)
        for sj in strJoin:
            res.append(sj.email,sj.role)
    return res

def Registration(d : dict, connection_string : str) -> RegStatus:
    given = d['email']
    AllUsers = exportUsers(connection_string)
    if given in [i[0] for i in AllUsers]:
        return RegStatus.ExistMail
    
    original = filter(lambda elem: elem[0]==given, AllUsers)[0]
    salt = original[0]
    hashedPas = hashlib.md5((d['password']+salt).encode())

    engine=create_engine(connection_string,echo=True)
    Session = sessionmaker(bind=engine)
    Session.add(Users(surname=' ',name=d['name'],fathername=' ',email=given,ph_number=' ',role='user',password=hashedPas))
    Session.commit()
    Session.close()
    return RegStatus.NewUser

if __name__=='__main__':
    pass
    