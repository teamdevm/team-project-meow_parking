from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware


app = FastAPI()

origins = [
    "http://localhost:3000",
    "localhost:3000"
]





app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

todos = [
    {
        "id": "1",
        "password": "Read a book."
    },
    {
        "id": "2",
        "password": "Cycle around town."
    }
]


@app.get("/todo", tags=["todos"])
async def get_todos() -> dict:
    return { "data": todos }