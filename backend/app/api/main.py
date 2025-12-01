from fastapi import FastAPI
from db.connection import get_db
from db.queries import get_offers
import mysql.connector

app = FastAPI()


@app.get("/hot-offers")
def get_hot_offers( limit: int = 10):
    db = get_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute(get_offers(), (limit,))
    result = cursor.fetchall()
    cursor.close()
    db.close()
    return result

