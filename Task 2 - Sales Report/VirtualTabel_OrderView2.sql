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