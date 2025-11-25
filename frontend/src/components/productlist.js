import React, { useEffect, useState } from 'react';

function ProductList() {
    const [products, setProducts] = useState([]);

    useEffect(() => {
        fetch('/api/products')  // ruft dein Python-Backend ab
            .then(res => res.json())
            .then(data => setProducts(data))
            .catch(err => console.error(err));
    }, []);

    if (products.length === 0) return <p>Loading products...</p>;

    return (
        <div>
            {products.map(p => (
                <div key={p.id} style={{ border: '1px solid #ccc', margin: '10px', padding: '10px' }}>
                    <h3>{p.name}</h3>
                    <p>Price: ${p.price}</p>
                </div>
            ))}
        </div>
    );
}

export default ProductList;
