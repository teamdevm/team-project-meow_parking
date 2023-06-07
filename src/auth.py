import hashlib
from enum import Enum
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from ..usersDB import Management, Rights, Roles, Users

# authorize status
class AuthStatus(Enum):
    NoData = 1
    IncorrectPassword = 2
    User = 3
    Admin = 4

def export(connection_string : str) -> list[str, str, str]:
    engineParkings = create_engine(connection_string, echo=True)
    engineParkings.connect()

    sessionParkings = sessionmaker(autoflush=False, bind=engineParkings)
    res = []
    with sessionParkings(autoflush=False, bind=engineParkings) as db:
        strJoin = db.query(Users.email, Users.password, Roles.role_name).select_from(Users).join(Roles, Users.role==Roles.id)
        for sj in strJoin:
            res.append(sj.email, sj.password, sj.role_name)
    return res

def authorize(d : dict, connection_string : str) -> AuthStatus:
    given = d['email']
    data = export(connection_string)
    if not given in [i[0] for i in data]:
        return AuthStatus.NoData
    original = filter(lambda elem: elem[0]==given, data)[0]
    salt = original[0]
    hashed = hashlib.md5((d['password']+salt).encode())
    if hashed.hexdigest() != original[1]:
        return AuthStatus.IncorrectPassword
    return AuthStatus.User if str(original[2]).lower() == 'user' else AuthStatus.Admin

if __name__=='__main__':
    pass
