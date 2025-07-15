select DISTINCT category FROM pizzatype;

SELECT pizzatype.category AS pizza_category, SUM(pesanandetail.quantity) AS total_quantity
FROM pizza
JOIN pizzatype on pizzatype.pizza_type_id = pizza.pizza_type_id
JOIN pesanandetail ON pesanandetail.pizza_id = pizza.pizza_id
GROUP BY pizzatype.category;


select name,category,ingredients, COUNT(pizza.pizza_id) AS total_pizzas from pizzatype
JOIN pizza on pizzatype.pizza_type_id=pizza.pizza_type_id
Group by pizzatype.category;


SELECT AVG(QUANTITY) avg_pizzas_per_day
FROM (select pesanan.date, SUM(pesanandetail.quantity) AS QUANTITY from pesanan 
join pesanandetail on pesanan.order_id=pesanandetail.order_id
group by pesanan.date) AS daily_summary;

SELECT SUM(pizza.price * pesanandetail.quantity) AS revenue, name
FROM pizza
JOIN pesanandetail ON pesanandetail.pizza_id = pizza.pizza_id
JOIN pizzatype ON pizzatype.pizza_type_id=pizza.pizza_type_id
GROUP BY name
order BY 1 DESC
limit 3;