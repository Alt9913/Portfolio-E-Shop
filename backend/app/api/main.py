from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from db.queries import get_offers, get_our_offers
import mysql.connector
import ssl

app = FastAPI()

# CORS für das Frontend (IP 192.168.134.128) aktivieren
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://192.168.134.128"],  # Frontend IP-Adresse hier eintragen
    allow_credentials=True,
    allow_methods=["*"],  # Erlaubt alle Methoden (GET, POST, etc.)
    allow_headers=["*"],  # Erlaubt alle Header
)

# Erstelle ein SSLContext-Objekt, wenn du SSL verwenden möchtest
context = ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)

# Optional: Lade Zertifikate (falls erforderlich)
# context.load_cert_chain(certfile='/path/to/client-cert.pem', keyfile='/path/to/client-key.pem')
# context.load_verify_locations(cafile='/path/to/ca-cert.pem')

# Funktion, um die MySQL-Datenbankverbindung zu erstellen
def get_db():
    return mysql.connector.connect(
        host="localhost",
        user="alt",
        password="admin",
        database="DATAMART_PRD",
        ssl_disabled=True  # SSL deaktivieren (für Entwicklungszwecke)
    )

@app.get("/hot-offers")
def get_hot_offers(limit: int = 3):
    try:
        # Verbindung zur DB aufbauen
        db = get_db()
        cursor = db.cursor(dictionary=True)
        cursor.execute(get_offers(), (limit,))
        
        # Holen der Ergebnisse
        result = cursor.fetchall()
        cursor.close()
        db.close()
        
        return result
    except mysql.connector.Error as err:
        # Falls ein Fehler in der DB-Verbindung oder Abfrage auftritt, eine Fehlerantwort senden
        raise HTTPException(status_code=500, detail=f"Fehler beim Abrufen der Angebote: {err}")

@app.get("/our-offers")
def get_our_offers(limit: int = 10):
    try:
        # Verbindung zur DB aufbauen
        db = get_db()
        cursor = db.cursor(dictionary=True)
        cursor.execute(get_our_offers(), (limit,))
        
        # Holen der Ergebnisse
        result = cursor.fetchall()
        cursor.close()
        db.close()
        
        return result
    except mysql.connector.Error as err:
        # Falls ein Fehler in der DB-Verbindung oder Abfrage auftritt, eine Fehlerantwort senden
        raise HTTPException(status_code=500, detail=f"Fehler beim Abrufen der Angebote: {err}")