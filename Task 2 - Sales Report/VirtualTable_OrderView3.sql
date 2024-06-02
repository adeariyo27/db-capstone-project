-- Creating view of a subquery that lists the menu names from the menus table for any order quantity with more than 2

CREATE VIEW OrdersView3 AS (
SELECT CourseName
FROM menuitems as mi
INNER JOIN menus as m
ON mi.MenuItemsID = m.MenuItemsID
WHERE MenuID = ANY (
    SELECT MenuID
    FROM orders
    WHERE quantity > 2
));