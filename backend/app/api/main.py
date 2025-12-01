from fastapi import FastAPI

app = FastAPI()

@app.get("/products")
def get_products():
    return [
        {"id": 1, "name": "Produkt A"},
        {"id": 2, "name": "Produkt B"}
    ]