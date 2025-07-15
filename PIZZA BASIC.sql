select COUNT(order_id) from pesanan;

select SUM(price*quantity) AS total_revenue FROM (SELECT * from pizza 
JOIN pizzatype,pesanandetail
WHERE pizza.pizza_type_id=pizzatype.pizza_type_id
and pesanandetail.pizza_id=pizza.pizza_id);

SELECT SUM(pizza.price * pesanandetail.quantity) AS total_revenue
FROM pizza
JOIN pizzatype ON pizza.pizza_type_id = pizzatype.pizza_type_id
JOIN pesanandetail ON pesanandetail.pizza_id = pizza.pizza_id;

SELECT pizza.price AS harga, pizzatype.name AS TYPE 
FROM pizza
JOIN pizzatype ON pizza.pizza_type_id=pizzatype.pizza_type_id
GROUP BY pizza.price
order by harga DESC
LIMIT 1;

SELECT pizza.size, SUM(pesanandetail.quantity) AS total_quantity
FROM pizza
JOIN pesanandetail ON pesanandetail.pizza_id = pizza.pizza_id
GROUP BY pizza.size
ORDER BY total_quantity DESC;

SELECT pizzatype.name AS pizza_type, SUM(pesanandetail.quantity) AS total_quantity
FROM pizza
JOIN pizzatype ON pizza.pizza_type_id = pizzatype.pizza_type_id
JOIN pesanandetail ON pesanandetail.pizza_id = pizza.pizza_id
GROUP BY pizzatype.name
ORDER BY total_quantity DESC
LIMIT 5;