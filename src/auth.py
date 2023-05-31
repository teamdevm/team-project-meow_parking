import hashlib
from enum import Enum
import psycopg2
from psycopg2 import sql


# authorize status
class AuthStatus(Enum):
    NoData = 1
    IncorrectPassword = 2
    User = 3
    Admin = 4

def export(connection_string : str) -> list[str, str, str]:
    conn = psycopg2.connect(dbname='users_roles_parking', user='postgres', 
                        password='postgres', host='localhost')
    cursor = conn.cursor()
    stmt = sql.SQL('SELECT users.email, users.password, roles.role_name FROM users JOIN roles ON users.role = roles.id')
    cursor.execute(stmt)
    res = []
    for row in cursor:
        res.append(*row)
    cursor.close()
    return res

def authorize(d : dict, connection_string : str):
    given = d['email']
    data = export(connection_string)
    if not given in [i[0] for i in data]:
        return AuthStatus.NoData
    original = filter(lambda elem: elem[0]==given, data)[0]
    salt = original[0]
    hashed = hashlib.md5((d['password']+salt).encode())
    if hashed.hexdigest() != original[1]:
        return AuthStatus.IncorrectPassword
    return AuthStatus.User


if __name__=='__main__':
    pass
