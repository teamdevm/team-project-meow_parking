import psycopg2
from psycopg2 import sql


def export(connection_string : str) -> list[str]:
    conn = psycopg2.connect(dbname='parkings', user='postgres', 
                        password='postgres', host='localhost')
    cursor = conn.cursor()
    stmt = sql.SQL('SELECT streets.name FROM parkings JOIN streets ON parkings.street = streets.id')
    cursor.execute(stmt)
    res = []
    for row in cursor:
        res.append(*row)
    cursor.close()
    return res

def search_parking(d : dict, connection_string : str, result_limit : int) -> list[str]:
    lst = export(connection_string)
    query = str(d['query']).lower()
    l, r = 0, len(query)+1
    filtered = None
    while r-l>1:
        m = (l+r)//2
        filtered = filter(lambda elem: elem[:m].lower() == query, lst)
        if len(filtered)>0:
            l=m
        else:
            r=m
    if l==0:
        return []
    return filtered if len(filtered)<=result_limit else filtered[:result_limit] 


if __name__=='__main__':
    pass