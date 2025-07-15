select COUNT(order_id) from pesanan;

select SUM(price*quantity) AS total_revenue FROM (SELECT * from pizza 
JOIN pizzatype,pesanandetail
WHERE pizza.pizza_type_id=pizzatype.pizza_type_id
and pesanandetail.pizza_id=pizza.pizza_id);

SELECT SUM(pizza.price * pesanandetail.quantity) AS total_revenue
FROM pizza
JOIN pizzatype ON pizza.pizza_type_id = pizzatype.pizza_type_id
JOIN pesanandetail ON pesanandetail.pizza_id = pizza.pizza_id;
