# SQL analysis using PIZZA dataset
This dataset is designed for SQL analysis exercises, providing comprehensive data on pizza sales, orders, and customer preferences. It includes details on order quantities, pizza types, and the composition of various pizzas. The dataset is ideal for practicing SQL queries, performing revenue analysis, and understanding customer behavior in the pizza industry.

## (Basic)
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

## 4. Identify the most common pizza size ordered.
    SELECT pizza.size, SUM(pesanandetail.quantity) AS total_quantity
    FROM pizza
    JOIN pesanandetail ON pesanandetail.pizza_id = pizza.pizza_id
    GROUP BY pizza.size
    ORDER BY total_quantity DESC;
Output:

<img width="450" height="203" alt="image" src="https://github.com/user-attachments/assets/1b5bb936-3fbd-48fd-9ad7-dd3b2a4e3849" />

## 5. List the top 5 most ordered pizza types along with their quantities.
    SELECT pizzatype.name AS pizza_type, SUM(pesanandetail.quantity) AS total_quantity
    FROM pizza
    JOIN pizzatype ON pizza.pizza_type_id = pizzatype.pizza_type_id
    JOIN pesanandetail ON pesanandetail.pizza_id = pizza.pizza_id
    GROUP BY pizzatype.name
    ORDER BY total_quantity DESC
    LIMIT 5;
Output:


<img width="440" height="202" alt="image" src="https://github.com/user-attachments/assets/53315550-4908-4ae7-b775-03087646d694" />

## (Intermediate)

## 1. Join the necessary tables to find the total quantity of each pizza category ordered.
    SELECT pizzatype.category AS pizza_category, SUM(pesanandetail.quantity) AS total_quantity
    FROM pizza
    JOIN pizzatype on pizzatype.pizza_type_id = pizza.pizza_type_id
    JOIN pesanandetail ON pesanandetail.pizza_id = pizza.pizza_id
    GROUP BY pizzatype.category;
Output:

<img width="448" height="166" alt="image" src="https://github.com/user-attachments/assets/90c98f40-fd77-44a7-91e9-450ddfa27591" />

## 2. Join relevant tables to find the category-wise distribution of pizzas.
    select name,category,ingredients, COUNT(pizza.pizza_id) AS total_pizzas from pizzatype
    JOIN pizza on pizzatype.pizza_type_id=pizza.pizza_type_id
    Group by pizzatype.category;
Output:

<img width="589" height="178" alt="image" src="https://github.com/user-attachments/assets/ef2a8e2c-a471-4ae4-9cb6-e7957dc24d99" />

## 3. Group the orders by date and calculate the average number of pizzas ordered per day.
    SELECT AVG(QUANTITY) avg_pizzas_per_day
    FROM (select pesanan.date, SUM(pesanandetail.quantity) AS QUANTITY from pesanan 
    join pesanandetail on pesanan.order_id=pesanandetail.order_id
    group by pesanan.date) AS daily_summary;
Output: 138.5

## 4. Determine the top 3 most ordered pizza types based on revenue.
    SELECT SUM(pizza.price * pesanandetail.quantity) AS revenue, name
    FROM pizza
    JOIN pesanandetail ON pesanandetail.pizza_id = pizza.pizza_id
    JOIN pizzatype ON pizzatype.pizza_type_id=pizza.pizza_type_id
    GROUP BY name
    order BY 1 DESC
    limit 3;
Output:

<img width="521" height="135" alt="image" src="https://github.com/user-attachments/assets/8eaff352-2f11-4f74-a896-4f9096c49a84" />




