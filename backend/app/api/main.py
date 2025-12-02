from fastapi import FastAPI
from db.queries import get_offers
import mysql.connector

app = FastAPI()

def get_db():
    return mysql.connector.connect(
        host="192.168.134.130",
        user="alt",
        password="admin",
        database="DATAMART_PRD",
        ssl_ca=None,
        ssl_verify_cert=False,
        ssl_verify_identity=False
    )

@app.get("/hot-offers")
def get_hot_offers(limit: int = 10):
    db = get_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute(get_offers(), (limit,))
    result = cursor.fetchall()
    cursor.close()
    db.close()
    return result
