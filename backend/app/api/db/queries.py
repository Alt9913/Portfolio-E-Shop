def get_offers():
    return """
    SELECT 
        p.id, 
        p.name, 
        p.price, 
        p.city, 
        p.picture_path, 
        p.link, 
        c.name AS country_name
    FROM products p
    LEFT JOIN country c 
        ON p.country_id = c.id
    ORDER BY p.date_created DESC
    LIMIT %s
    """
