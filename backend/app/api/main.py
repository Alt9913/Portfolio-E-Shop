from fastapi import FastAPI
from db.queries import get_offers
import mysql.connector
import MySQLdb

app = FastAPI()

def get_db():
    return MySQLdb.connect(
        host="192.168.134.130",  # Die IP-Adresse des MySQL-Servers
        user="alt",
        password="admin",
        database="DATAMART_PRD"
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
