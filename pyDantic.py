from datetime import datetime
from typing import List, Optional
from typing import List, Optional
from fastapi import APIRouter, Depends, Query, FastAPI
from pydantic import BaseModel


class User(BaseModel):
    id: int
    name = 'John Doe'
    signup_ts: Optional[datetime] = None
    friends: List[int] = []

external_data = {'id': '123', 'signup_ts': '2017-06-01 12:22', 'friends': [1, '2', b'3']}
user = User(**external_data)
print(user)
#> User id=123 name='John Doe' signup_ts=datetime.datetime(2017, 6, 1, 12, 22) friends=[1, 2, 3]
print(user.id)
#> 123

app = FastAPI()

class GraphBase(BaseModel):
    start: str
    end: str
    distance: int

class GraphList(BaseModel):
    data: List[GraphBase]

@app.post("/dummypath")
async def get_body(data: GraphList):
    return data

