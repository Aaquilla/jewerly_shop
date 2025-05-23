CREATE DATABASE jewelry_shop;
USE jewelry_shop;

CREATE TABLE item_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE metals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE gemstones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) -- Дорогоцінний, Напівкоштовний, Виробний, Перли
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    item_type_id INT,
    metal_id INT,
    gemstone_id INT NULL,
    price DECIMAL(10, 2),
    FOREIGN KEY (item_type_id) REFERENCES item_types(id),
    FOREIGN KEY (metal_id) REFERENCES metals(id),
    FOREIGN KEY (gemstone_id) REFERENCES gemstones(id)
);

INSERT INTO item_types (name) VALUES
('Кільця (обручальні)'),
('Кільця (заручні)'),
('Кільця (коктейльні)'),
('Сережки (пусети)'),
('Серьги (підвіски)'),
('Серьги (кафи)'),
('Кольє'),
('Ланцюжки'),
('Підвіски'),
('Браслети'),
('Броші'),
('Годинник'),
('Запонки'),
('Затискачі для краваток'),
('Футляри для прикрас'),
('Засоби для догляду за ювелірними виробами');

INSERT INTO metals (name) VALUES
('Золото 585 проби (жовте)'),
('Золото 750 проби (біле)'),
('Золото 750 проби (рожеве)'),
('Срібло 925 проби'),
('Платина 950 проби'),
( 'Паладій 950 проби');

INSERT INTO gemstones (name, category) VALUES
( "Діамант", "Коштовний"),
( "Рубін", "Коштовний"),
('Сапфір', 'Коштовний'),
('Ізумруд', 'Коштовний'),
('Топаз', 'Напівдорогоцінний'),
('Аметист', 'Напівдорогоцінний'),
('Гранат', 'Напівдорогоцінний'),
('Цитрін', 'Напівдорогоцінний'),
('Яшма', 'Зроблений'),
('Малахіт', 'Зроблений'),
('Агат', 'Зроблений'),
('Перли натуральні', 'Перли'),
('Перли культивовані', 'Перли');

INSERT INTO products (name, item_type_id, metal_id, gemstone_id, price) VALUES
('Обручка з діамантом', 1, 1, 1, 15000.00),
('Заручне кільце з сапфіром', 2, 2, 3, 20000.00),
('Коктейльне кільце з гранатом', 3, 3, 7, 7500.00),
('Сережки-пусети зі смарагдами', 4, 2, 4, 12000.00),
('Сережки-підвіски з перлами', 5, 4, 12, 8000.00),
('Кільє з рубіном', 7, 5, 2, 25000.00),
('Ланцюжок золотий', 8, 1, NULL, 6000.00),
('Браслет з агатом', 10, 4, 11, 5000.00),
('Брошь з топазом', 11, 6, 5, 4500.00),
('Годинник з платиновим корпусом', 12, 5, NULL, 50000.00),
('Запонки з паладію', 13, 6, NULL, 7000.00),
('Футляр для прикрас', 15, NULL, NULL, 1500.00),
('Засіб для догляду за сріблом', 16, NULL, NULL, 500.00);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    address TEXT
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT DEFAULT 1,
    price_at_purchase DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
-- наповнення таблиць
INSERT INTO customers (first_name, last_name, email, phone, address) VALUES
('Олександр', 'Шевченко', 'shevchenko@example.com', '+380931234567', 'Київ, вул. Хрещатик, 15'),
('Марина', 'Іванова', 'ivanova@example.com', '+380671234568', 'Львів, проспект Свободи, 10'),
('Ігор', 'Петренко', 'petrenko@example.com', '+380501234569', 'Одеса, вул. Дерибасівська, 5'),
('Егор', 'Сидоренко', 'sidorenko@gmail.ua', '+380963584654', 'Місто Дніпро, вул. Грушевського, 85'),
('Андрій', 'Ковальчук', 'kovalchuk@gmail.com', '+380573813594', 'Місто Одеса, вул. Незалежності, 44'),
('Дмитро', 'Ковальчук', 'D.kovalchuk@mail.ua', '+380728599264', 'Місто Львів, вул. Шевченка, 29'),
('Богдан', 'Петренко', 'petrenko@ukr.net', '+380944668970', 'Місто Харків, вул. Грушевського, 25'),
('Іван', 'Сидоренко', 'vanya@example.com', '+380652606309', 'Місто Одеса, вул. Соборна, 88'),
('Ірина', 'Ковальчук', 'irisha@example.com', '+380553206886', 'Місто Дніпро, вул. Незалежності, 97'),
('Олена', 'Петренко', 'olenka10@gmail.com', '+380869949257', 'Місто Одеса, вул. Незалежності, 59'),
('Дмитро', 'Сидоренко', 'dimulka@gmail.ua', '+380919998929', 'Місто Дніпро, вул. Шевченка, 99'),
('Олена', 'Бондар', 'bondar@gmail.com', '+380956528372', 'Місто Одеса, вул. Соборна, 20'),
('Андрій', 'Іванова', 'ivanova@gmail.com', '+380707736332', 'Місто Одеса, вул. Соборна, 72'),
('Марина', 'Петренко', 'marinka@gmail.com', '+380876581411', 'Місто Одеса, вул. Соборна, 60'),
('Ігор', 'Мельник', 'melnik@gmail.com', '+380889153976', 'Місто Дніпро, вул. Шевченка, 89'),
('Світлана', 'Сидоренко', 'svetik@gmail.com', '+380518818193', 'Місто Одеса, вул. Соборна, 7'),
('Дмитро', 'Кравченко', 'kravchenko@gmail.ua', '+380973395271', 'Місто Дніпро, вул. Соборна, 100'),
('Марина', 'Сидоренко', 'marina_sidorenko@ukr.net', '+380542259552', 'Місто Харків, вул. Незалежності, 15'),
('Ігор', 'Ткаченко', 'tkachenko@gmail.ua', '+380537502966', 'Місто Дніпро, вул. Соборна, 4'),
('Данило', 'Іванов', 'denchik@gmail.ua', '+380756000864', 'Місто Харків, вул. Соборна, 77'),
('Ірина', 'Гарна', 'garnulya@example.com', '+380725218018', 'Місто Київ, вул. Незалежності, 85'),
('Ірина', 'Ковальчук', 'kovalchuk@ukr.net', '+380632316246', 'Місто Дніпро, вул. Соборна, 80'),
('Ірина', 'Кравченко', 'kravchenko@ukr.net', '+380871170660', 'Місто Дніпро, вул. Незалежності, 59'),
('Дарина', 'Петренко', 'daruna@ukr.net', '+380563975900', 'Місто Дніпро, вул. Шевченка, 69'),
('Дмитро', 'Кравченко', 'd.kravchenko@ukr.net', '+380766989725', 'Місто Київ, вул. Незалежності, 47'),
('Олена', 'Іванова', 'o.ivanova@gmail.com', '+380812958445', 'Місто Львів, вул. Незалежності, 74'),
('Світлана', 'Іванова', 's.ivanova@gmail.com', '+380575720581', 'Місто Одеса, вул. Шевченка, 31'),
('Наталія', 'Ковальчук', 'natashka@example.com', '+380567963941', 'Місто Львів, вул. Грушевського, 92'),
('Олена', 'Прекрасна', 'beautifull.o@ukr.net', '+380511255819', 'Місто Дніпро, вул. Незалежності, 76'),
('Олександр', 'Сидоренко', 'o.sidorenko@example.com', '+380541135084', 'Місто Харків, вул. Грушевського, 2');

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2025-04-20', 21000.00),
(2, '2025-04-21', 8000.00),
(3, '2025-04-22', 12000.00),
(4, '2025-05-05', 11932),
(5, '2025-05-06', 19485),
(6, '2025-05-07', 10985),
(7, '2025-05-08', 14734),
(8, '2025-05-09', 21186),
(9, '2025-05-10', 3748),
(10, '2025-05-11', 5054),
(11, '2025-05-12', 23286),
(12, '2025-05-13', 22703),
(13, '2025-05-14', 6236),
(14, '2025-05-15', 21273),
(15, '2025-05-16', 15066),
(16, '2025-05-17', 15203),
(17, '2025-05-18', 10587),
(18, '2025-05-19', 23529),
(19, '2025-05-20', 3021),
(20, '2025-05-21', 4119),
(21, '2025-05-22', 21084),
(22, '2025-05-23', 18864),
(23, '2025-05-24', 14988),
(24, '2025-05-25', 20503),
(25, '2025-05-26', 11677),
(26, '2025-05-27', 11516),
(27, '2025-05-28', 8626),
(28, '2025-05-29', 8212),
(29, '2025-05-30', 24856),
(30, '2025-05-31', 13564);

INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(1, 1, 1, 15000.00),
(1, 7, 1, 6000.00), 
(2, 5, 1, 8000.00),  
(3, 4, 2, 6000.00), 
(4, 13, 3, 13822),
(5, 7, 1, 10214),
(6, 6, 1, 15801),
(7, 6, 2, 14942),
(8, 5, 1, 10534),
(9, 3, 1, 18975),
(10, 5, 3, 13118),
(11, 7, 3, 4664),
(12, 6, 1, 3764),
(13, 4, 2, 7705),
(14, 3, 3, 7884),
(15, 11, 3, 16204),
(16, 3, 2, 14675),
(17, 5, 2, 11950),
(18, 5, 1, 3866),
(19, 3, 3, 8206),
(20, 13, 3, 12852),
(21, 7, 2, 9637),
(22, 1, 1, 15553),
(23, 5, 3, 7718),
(24, 10, 3, 18046),
(25, 10, 2, 16275),
(26, 2, 1, 11187),
(27, 9, 2, 17626),
(28, 11, 2, 11989),
(29, 10, 2, 7800),
(30, 8, 3, 11804),
(4, 10, 2, 9233),
(5, 12, 1, 13552),
(6, 9, 3, 4398),
(7, 8, 2, 16498),
(8, 1, 1, 14111),
(9, 11, 1, 17038),
(10, 9, 3, 4448),
(11, 4, 3, 8037);
 

SELECT * FROM item_types;
SELECT * FROM metals;
SELECT * FROM gemstones;
SELECT * FROM products;

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM order_items;

show tables; 

CREATE VIEW customer_order_summary AS
SELECT 
    c.id AS customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    SUM(oi.quantity) AS total_items_ordered
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
LEFT JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id, c.first_name, c.last_name;

-- 3 пункт

-- 1. Створення ролей
CREATE ROLE administrator;
CREATE ROLE operator;
CREATE ROLE guest;

-- 2. Призначення привілеїв ролям

-- Адміністратор: повний доступ
GRANT ALL PRIVILEGES ON jewelry_shop.* TO administrator;

-- Оператор: читання всіх таблиць, запис у products, orders, customers
GRANT SELECT ON jewelry_shop.* TO operator;
GRANT INSERT, UPDATE ON jewelry_shop.products TO operator;
GRANT INSERT, UPDATE ON jewelry_shop.orders TO operator;
GRANT INSERT, UPDATE ON jewelry_shop.customers TO operator;

-- Гість: лише читання обмежених таблиць
GRANT SELECT ON jewelry_shop.products TO guest;
GRANT SELECT ON jewelry_shop.metals TO guest;
GRANT SELECT ON jewelry_shop.gemstones TO guest;

-- 3. Створення користувачів та призначення ролей
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'AdminPass123!';
CREATE USER 'operator_user'@'localhost' IDENTIFIED BY 'Operator123!';
CREATE USER 'guest_user'@'localhost' IDENTIFIED BY 'Guest123!';

GRANT administrator TO 'admin_user'@'localhost';
GRANT operator TO 'operator_user'@'localhost';
GRANT guest TO 'guest_user'@'localhost';

-- Активуємо роль за замовчуванням для користувачів
SET DEFAULT ROLE administrator TO 'admin_user'@'localhost';
SET DEFAULT ROLE operator TO 'operator_user'@'localhost';
SET DEFAULT ROLE guest TO 'guest_user'@'localhost';

-- 3.3 Аналіз вразливостей таблиць та методи їх усунення

-- Додаємо обмеження NOT NULL
ALTER TABLE products MODIFY price DECIMAL(10,2) NOT NULL;
ALTER TABLE orders MODIFY order_date DATE NOT NULL;
-- Унікальність телефону
ALTER TABLE customers ADD CONSTRAINT unique_phone UNIQUE (phone);

-- стратегія шифрування

-- Додавання шифрованих полів
ALTER TABLE customers
ADD encrypted_email VARBINARY(255),
ADD encrypted_phone VARBINARY(255),
ADD encrypted_address VARBINARY(512);

-- Шифрування на вставці
UPDATE customers
SET
  encrypted_email = AES_ENCRYPT(email, 'secureKEY'),
  encrypted_phone = AES_ENCRYPT(phone, 'secureKEY'),
  encrypted_address = AES_ENCRYPT(address, 'secureKEY');

-- Очистка відкритих даних
UPDATE customers SET email = NULL, phone = NULL, address = NULL;

-- Розшифрування приклад
SELECT AES_DECRYPT(encrypted_email, 'secureKEY') FROM customers;

-- система аудиту

-- Таблиця журналу аудиту
CREATE TABLE audit_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action_type ENUM('INSERT', 'UPDATE', 'DELETE'),
    table_name VARCHAR(50),
    record_id INT,
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_info VARCHAR(255) -- Можна записувати CURRENT_USER або ідентифікатор користувача
);

-- Тригер на INSERT
DELIMITER //
CREATE TRIGGER trg_orders_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action_type, table_name, record_id, user_info)
    VALUES ('INSERT', 'orders', NEW.id, CURRENT_USER());
END;
//
DELIMITER ;

-- Тригер на UPDATE
DELIMITER //
CREATE TRIGGER trg_orders_update
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action_type, table_name, record_id, user_info)
    VALUES ('UPDATE', 'orders', NEW.id, CURRENT_USER());
END;
//
DELIMITER ;

-- Тригер на DELETE
DELIMITER //
CREATE TRIGGER trg_orders_delete
AFTER DELETE ON orders
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action_type, table_name, record_id, user_info)
    VALUES ('DELETE', 'orders', OLD.id, CURRENT_USER());
END;
//
DELIMITER ;

-- Процедура перевірки спроб несанкціонованого доступу

-- Таблиця спроб доступу
CREATE TABLE unauthorized_access_attempts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    attempted_action VARCHAR(255),
    attempt_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(50),
    result VARCHAR(50)
);

-- Процедура для формування звіту
DELIMITER //
CREATE PROCEDURE check_unauthorized_access()
BEGIN
    SELECT * FROM unauthorized_access_attempts
    WHERE attempt_time >= NOW() - INTERVAL 1 DAY;
END;
//
DELIMITER ;

-- перевірка несанкціонованного доступу
CALL check_unauthorized_access();


-- Індекси для покращення продуктивності
CREATE INDEX idx_customer_email ON customers(email);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
CREATE INDEX idx_products_metal_id ON products(metal_id);
CREATE INDEX idx_products_gemstone_id ON products(gemstone_id);

-- Приклад механізму транзакцій у базі даних

-- 1. Початок транзакції
START TRANSACTION;

-- 2. Створення нового замовлення та додавання позицій до нього
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES (1, CURDATE(), 18500.00);

-- Припустимо, що щойно створене замовлення отримало ID = LAST_INSERT_ID()
SET @order_id = LAST_INSERT_ID();

-- Додаємо позиції замовлення
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase)
VALUES 
(@order_id, 2, 1, 12000.00),
(@order_id, 5, 1, 6500.00);

-- 3. Фіксація змін
COMMIT;

-- реалізація аналітичного звіту

-- Метрика 1: Загальна сума замовлень по кожному клієнту

CREATE VIEW total_spent_per_customer AS
SELECT 
    c.id AS customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, full_name;

-- Метрика 2: Середня вартість замовлення

CREATE VIEW avg_order_value AS
SELECT 
    AVG(total_amount) AS average_order_value
FROM orders;

-- Метрика 3: Найпопулярніші товари за кількістю продажів

CREATE VIEW top_selling_products AS
SELECT 
    p.id AS product_id,
    p.name AS product_name,
    SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.id, p.name
ORDER BY total_sold DESC
LIMIT 10;

-- Метрика 4: Кількість замовлень за типами виробів

CREATE VIEW orders_per_item_type AS
SELECT 
    it.name AS item_type,
    COUNT(DISTINCT o.id) AS total_orders
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON p.id = oi.product_id
JOIN item_types it ON it.id = p.item_type_id
GROUP BY it.name
ORDER BY total_orders DESC;

-- Метрика 5: Динаміка замовлень за місяцями

CREATE VIEW monthly_order_stats AS
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY order_month
ORDER BY order_month;

select * from total_spent_per_customer
select * from avg_order_value
select * from top_selling_products
select * from orders_per_item_type
select * from monthly_order_stats





