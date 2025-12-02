from fastapi import FastAPI
from db.queries import get_offers
import mysql.connector
import ssl

app = FastAPI()

# Erstelle ein SSLContext-Objekt, wenn du SSL verwenden möchtest
context = ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)

# Optional: Lade Zertifikate (falls erforderlich)
#context.load_cert_chain(certfile='/path/to/client-cert.pem', keyfile='/path/to/client-key.pem')
#context.load_verify_locations(cafile='/path/to/ca-cert.pem')

# Funktion, um die MySQL-Datenbankverbindung zu erstellen
def get_db():
    # Verbindung zu MySQL mit SSL-Zertifikaten
    return mysql.connector.connect(
        host="localhost",
        user="alt",
        password="admin",
        database="DATAMART_PRD",
        #ssl_ca="/path/to/ca-cert.pem",        # Das CA-Zertifikat
        #ssl_cert="/path/to/client-cert.pem",  # Dein Client-Zertifikat
        #ssl_key="/path/to/client-key.pem",    # Dein Client-Schlüssel
        #ssl_verify_cert=True,                 # SSL-Zertifikat verifizieren
        #ssl_verify_identity=True             # Identität des Servers verifizieren
        ssl_disabled = True
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