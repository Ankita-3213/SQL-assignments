----subqueries 
select * from Users 
where users_id in (select distinct users_id from Booking);

--------------
select * from FoodItem;
insert into FoodItem ( item_name,item_descr, is_combo,price) values
('Burger','',0,75),
('Pizza','Margerita',0,150);

alter table FoodItem
add combo_price decimal(10,3);

SELECT SUM(price) AS combo_price
FROM FoodItem
WHERE is_combo = 0 AND item_name IN ('Classic Popcorn', 'Soft Drink');

UPDATE FoodItem
SET combo_price = (
    SELECT SUM(price)
    FROM FoodItem
    WHERE is_combo = 0 AND item_name IN ('Classic Popcorn', 'Soft Drink')
)
WHERE is_combo = 1 AND item_name = 'Combo 1';

UPDATE FoodItem
SET combo_price = (
    SELECT SUM(price)
    FROM FoodItem
    WHERE is_combo = 0 AND item_name IN ('Cheese Nachos', 'Soft Drink','Brownie')
)
WHERE is_combo = 1 AND item_name = 'Combo 2';

UPDATE FoodItem
SET combo_price = (
    SELECT SUM(price)
    FROM FoodItem
    WHERE is_combo = 0 AND item_name IN ('Burger', 'Soft Drink','French Fries')
)
WHERE is_combo = 1 AND item_name = 'Combo 3';
