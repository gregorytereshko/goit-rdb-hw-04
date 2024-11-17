-- Використання схеми
USE goit_topic_3;

-- 4.1 Підрахувати кількість рядків після INNER JOIN між усіма таблицями
SELECT COUNT(*)
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
INNER JOIN suppliers s ON p.supplier_id = s.id
INNER JOIN shippers sh ON o.shipper_id = sh.id;

-- 4.2 Використання LEFT JOIN для включення усіх рядків з лівої таблиці
SELECT COUNT(*)
FROM order_details od
LEFT JOIN orders o ON od.order_id = o.id
RIGHT JOIN customers c ON o.customer_id = c.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
INNER JOIN suppliers s ON p.supplier_id = s.id
INNER JOIN shippers sh ON o.shipper_id = sh.id;
-- Кількість рядків не змінилась, оскільки тому що всі дані в таблицях мають відповідні зв’язки.
-- Це означає, що для кожного рядка в таблиці зліва (наприклад, order_details) знайдено відповідний рядок у таблиці справа (наприклад, orders)
-- і навпаки для RIGHT

-- 4.3 Вибрати лише ті рядки, де employee_id > 3 і employee_id <= 10
SELECT *
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN employees e ON o.employee_id = e.employee_id
WHERE e.employee_id > 3 AND e.employee_id <= 10;

-- 4.4 Групувати за назвою категорії та обчислити кількість рядків і середню кількість товару
SELECT 
    cat.name,
    COUNT(od.id) AS total_rows,
    AVG(od.quantity) AS avg_quantity
FROM order_details od
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
GROUP BY cat.name;

-- 4.5 Вибрати категорії, де середня кількість товару більше за 21
SELECT 
    cat.name,
    COUNT(od.id) AS total_rows,
    AVG(od.quantity) AS avg_quantity
FROM order_details od
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
GROUP BY cat.name
HAVING AVG(od.quantity) > 21;

-- 4.6 Сортувати категорії за кількістю рядків у спадному порядку
SELECT 
    cat.name,
    COUNT(od.id) AS total_rows,
    AVG(od.quantity) AS avg_quantity
FROM order_details od
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
GROUP BY cat.name
ORDER BY total_rows DESC;

-- 4.7 Пропустити перший рядок і вибрати наступні чотири
SELECT 
    cat.name,
    COUNT(od.id) AS total_rows,
    AVG(od.quantity) AS avg_quantity
FROM order_details od
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
GROUP BY cat.name
ORDER BY total_rows DESC
LIMIT 4 OFFSET 1;