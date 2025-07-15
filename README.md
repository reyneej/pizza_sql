# pizza_sql
This dataset is designed for SQL analysis exercises, providing comprehensive data on pizza sales, orders, and customer preferences. It includes details on order quantities, pizza types, and the composition of various pizzas. The dataset is ideal for practicing SQL queries, performing revenue analysis, and understanding customer behavior in the pizza industry.

## 1. Retrieve the total number of orders placed.
    select COUNT(order_id) from pesanan;
Output: 21350
## 2. Calculate the total revenue generated from pizza sales.
    select SUM(price*quantity) AS total_revenue FROM (SELECT * from pizza 
    JOIN pizzatype,pesanandetail
    WHERE pizza.pizza_type_id=pizzatype.pizza_type_id
    and pesanandetail.pizza_id=pizza.pizza_id);
Output: 817860.05
## 3. Identify the highest-priced pizza.
    SELECT pizza.price AS harga, pizzatype.name AS TYPE 
    FROM pizza
    JOIN pizzatype ON pizza.pizza_type_id=pizzatype.pizza_type_id
    GROUP BY pizza.price
    order by harga DESC
    LIMIT 1;
Output:
<img width="483" height="76" alt="image" src="https://github.com/user-attachments/assets/976f3745-6510-444c-8037-8bbf60f1baf0" />


