SELECT users.name, orders.order_date  
FROM users  
JOIN orders  
ON users.id = orders.user_id;