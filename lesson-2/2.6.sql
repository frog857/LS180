CREATE TABLE menu_items (
    item text,
    prep_time integer,
    ingredient_cost numeric(4,2),
    sales integer,
    menu_price numeric(4,2)
);


INSERT INTO menu_items VALUES ('omelette', 10, 1.50, 182, 7.99);
INSERT INTO menu_items VALUES ('tacos', 5, 2.00, 254, 8.99);
INSERT INTO menu_items VALUES ('oatmeal', 1, 0.50, 79, 5.99);

-- Query to determine most profitable item
SELECT item, (menu_price - ingredient_cost) AS "Profit per item" FROM menu_items
ORDER BY (menu_price - ingredient_cost) DESC;

-- Query to determine most profitable item including labor costs
SELECT item, menu_price, ingredient_cost, 
round(((prep_time / 60.0) * 13), 2) AS labor,
round((menu_price - ingredient_cost) - ((prep_time / 60.0) * 13), 2) AS profit 
FROM menu_items
ORDER BY profit DESC;