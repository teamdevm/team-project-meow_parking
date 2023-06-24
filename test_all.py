import pytest
from src.reg import Registration, RegStatus
from src.auth import authorize, AuthStatus
from src.search import search_parking, CheckUserParkingPlaces
from src.ResPlace import PlaceReservation, FreeingUpParkingPlace, ResStatus


def test_registration():
    # res = Registration({
    #         'email' : 'ponkinikita@gmail.com',
    #         'password' : '1234567',
    #         'name' : 'Nikita'
    #     },
    #     'postgresql+psycopg2://localhost:5432/parking_information'
    # )
    # assert res == RegStatus.NewUser
    
    res = Registration({
            'email' : 'ponkinikita@gmail.com',
            'password' : '1234567',
            'name' : 'Nikita'
        },
        'postgresql+psycopg2://localhost:5432/parking_information'
    )
    assert res == RegStatus.ExistMail

def test_auth():
    res = authorize({
            'email' : 'ponkinikita@gmail.com',
            'password' : '1234567'
        },
        'postgresql+psycopg2://localhost:5432/parking_information'
    )
    assert res[0][0] == AuthStatus.User

    res = authorize({
            'email' : 'ponkinikita@gmail.com',
            'password' : '123456'
        },
        'postgresql+psycopg2://localhost:5432/parking_information'
    )
    assert res[0][0] == AuthStatus.IncorrectPassword

    res = authorize({
            'email' : 'dfwdfsdfsdf@gmail.com',
            'password' : '123456'
        },
        'postgresql+psycopg2://localhost:5432/parking_information'
    )
    assert res[0][0] == AuthStatus.NoData
    
def test_search():
    res = search_parking(
        {'search' : 'Пушкина'},
        'postgresql+psycopg2://localhost:5432/parking_information'
    )

    assert len(res) == 1 and res[0][3]==19

def test_res_and_free():
    res = PlaceReservation(
        {'user_id' : 12, 'parking_id' : 1},
        'postgresql+psycopg2://localhost:5432/parking_information'
    )

    assert res == ResStatus.SuccessRes

    res = CheckUserParkingPlaces(
        {'user_id' : 12},
        'postgresql+psycopg2://localhost:5432/parking_information'
    )

    assert len(res) == 1 and res[0][1] == 'ПУШКИНА'

    res = FreeingUpParkingPlace(
        {'user_id' : 12, 'parking_id' : 1},
        'postgresql+psycopg2://localhost:5432/parking_information'
    )

    assert res

    