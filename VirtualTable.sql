-- View for orders with quantity greater than 2
CREATE VIEW OrdersView1 AS (
SELECT OrderID, Quantity, TotalCost as Bill_Amount
FROM Orders
WHERE Quantity > 2
);

-- Order details for orders with cost greater than 150
CREATE VIEW OrdersView2 AS (
SELECT
	c.CustomerID,
    c.FullName,
    o.OrderID,
    o.TotalCost as Bill_Amoint,
    m.Cuisine,
    mi.CourseName
FROM Orders o
INNER JOIN Customers c
  ON o.CustomerID = c.CustomerID
INNER JOIN Menus m
  ON o.MenuID = m.MenuID
INNER JOIN MenuItems mi
  ON m.MenuItemsID = mi.MenuItemsID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost
);

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