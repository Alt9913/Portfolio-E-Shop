def get_offers():
    return """
        SELECT id, name, price, land, city, picture_path, link
        FROM products
        ORDER BY date_created DESC
        LIMIT %s
    """