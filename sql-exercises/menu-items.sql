-- 1

SELECT item, prep_time, ingredient_cost, menu_price, 
trunc(menu_price - (((prep_time / 60.0) * 15) + ingredient_cost), 2) AS profit,
menu_price * sales AS total_sales,
profit * sales AS total_profit 
FROM menu_items ORDER BY profit DESC;

SELECT
  item,
  prep_time,
  ingredient_cost,
  menu_price,
  profit,
  menu_price * sales AS total_sales,
  profit * sales AS total_profit
FROM (
  SELECT
    item,
    prep_time,
    ingredient_cost,
    menu_price,
    sales,
    TRUNC(menu_price - (((prep_time / 60.0) * 15) + ingredient_cost), 2) AS profit
  FROM menu_items
) sub
ORDER BY profit DESC;
