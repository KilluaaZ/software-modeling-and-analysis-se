CREATE DATABASE OzoneDb;

USE OzoneDb;

CREATE TABLE User (
    UserID VARCHAR(22) PRIMARY KEY,
    Username VARCHAR(22),
    Password VARCHAR(22),
    Firstname VARCHAR(22),
    Lastname VARCHAR(22),
    Phone INT,
    Email VARCHAR(40)
);
CREATE TABLE Address (
    AddressID VARCHAR(22) PRIMARY KEY,
    Country VARCHAR(22),
    City VARCHAR(22),
    PostalCode INT,
    Street VARCHAR(22),
    UserID VARCHAR(22),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(20),
    Details VARCHAR(255)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(20),
    Quantity INT,
    Price DECIMAL(10, 2),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE ShoppingCart (
    ShoppingCartID VARCHAR(22) PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE `Order` (
    OrderID VARCHAR(22) PRIMARY KEY,
    OrderDate DATETIME,
    Status VARCHAR(22),
    PaymentMethod VARCHAR(22),
    Total DECIMAL(10, 2),
    TrickingNumber INT,
    Discount VARCHAR(22),
    UserID VARCHAR(22),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE OrderInfo (
    OrderID VARCHAR(20) PRIMARY KEY,
    Price DECIMAL(10, 2),
    ShippingDate DATETIME,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
);

INSERT INTO Category (CategoryID, Name, Details) VALUES 
(1, 'Лаптопи', 'Различни модели лаптопи'),
(2, 'Монитори', 'LED и LCD монитори'),
(3, 'Настолни компютри', 'Системи за настолни компютри'),
(4, 'PC компоненти', 'Процесори, RAM, дънни платки и др.'),
(5, 'Виртуална реалност', 'Устройства за виртуална реалност'),
(6, 'Мрежови устройства', 'Рутери, суичове и др.'),
(7, 'Софтуер', 'Операционни системи и приложения'),
(8, 'Принтери консумативи', 'Принтери и различни консумативи'),
(9, 'Периферия', 'Клавиатури, мишки, слушалки и др.');

INSERT INTO User (UserID, Username, Password, Firstname, Lastname, Phone, Email) VALUES
('U001', 'ivan_ivanov', 'pass123', 'Иван', 'Иванов', 123456789, 'ivan.ivanov@mail.bg'),
('U002', 'maria_petkova', 'secure123', 'Мария', 'Петрова', 234567890, 'maria.petrova@mail.bg'),
('U003', 'georgi_georgiev', 'abc123', 'Георги', 'Георгиев', 345678901, 'georgi.georgiev@mail.bg'),
('U004', 'desislava_kostova', 'pass321', 'Десислава', 'Костова', 456789012, 'desislava.kostova@mail.bg'),
('U005', 'svetlin_nikolov', 'qwerty123', 'Светлин', 'Николов', 567890123, 'svetlin.nikolov@mail.bg'),
('U006', 'petar_ivanov', '123456', 'Петър', 'Иванов', 678901234, 'petar.ivanov@mail.bg'),
('U007', 'anna_slavova', 'abc1234', 'Анна', 'Славова', 789012345, 'anna.slavova@mail.bg'),
('U008', 'ivanna_dancheva', 'pass567', 'Иванна', 'Данчева', 890123456, 'ivanna.dancheva@mail.bg'),
('U009', 'dimitar_petrov', 'petrov321', 'Димитър', 'Петров', 901234567, 'dimitar.petrov@mail.bg'),
('U010', 'elena_petkova', 'elena123', 'Елена', 'Петкова', 123890567, 'elena.petkova@mail.bg'),
('U011', 'viktor_slavov', 'viktor123', 'Виктор', 'Славов', 345678900, 'viktor.slavov@mail.bg'),
('U012', 'sandra_ivanova', 'sandra321', 'Сандра', 'Иванова', 678901234, 'sandra.ivanova@mail.bg'),
('U013', 'martin_ivanov', 'martin123', 'Мартин', 'Иванов', 789012345, 'martin.ivanov@mail.bg'),
('U014', 'neli_petkova', 'neli123', 'Нели', 'Петрова', 890123456, 'neli.petrova@mail.bg'),
('U015', 'ivan_danchev', 'danchev123', 'Иван', 'Данчев', 901234567, 'ivan.danchev@mail.bg');

INSERT INTO Address (AddressID, Country, City, PostalCode, Street, UserID) VALUES
('A001', 'България', 'София', 1000, 'ул. Първа', 'U001'),
('A002', 'България', 'Пловдив', 4000, 'ул. Втора', 'U002'),
('A003', 'България', 'Варна', 9000, 'ул. Трета', 'U003'),
('A004', 'България', 'Бургас', 8000, 'ул. Четвърта', 'U004'),
('A005', 'България', 'Русе', 7000, 'ул. Пета', 'U005'),
('A006', 'България', 'Стара Загора', 6000, 'ул. Шеста', 'U006'),
('A007', 'България', 'Плевен', 4000, 'ул. Седма', 'U007'),
('A008', 'България', 'Видин', 3000, 'ул. Осма', 'U008'),
('A009', 'България', 'Благоевград', 2700, 'ул. Девета', 'U009'),
('A010', 'България', 'Сливен', 8800, 'ул. Десета', 'U010');

INSERT INTO Product (ProductID, Name, Quantity, Price, CategoryID) VALUES
(1, 'Lenovo IdeaPad', 20, 1500.00, 1),
(2, 'Samsung LED Monitor', 15, 450.00, 2),
(3, 'HP DeskJet Printer', 10, 250.00, 8),
(4, 'Intel i7 Processor', 30, 500.00, 4),
(5, 'NVIDIA VR Headset', 5, 1200.00, 5),
(6, 'TP-Link Router', 25, 120.00, 6),
(7, 'Windows 11', 50, 150.00, 7),
(8, 'Apple Wireless Keyb', 20, 100.00, 9),
(9, 'Dell Desktop', 12, 1300.00, 3),
(10, 'Asus VivoBook', 25, 1600.00, 1),
(11, 'Acer Predator', 15, 1800.00, 1),
(12, 'LG Ultrafine', 10, 500.00, 2),
(13, 'BenQ 27" Monitor', 15, 420.00, 2),
(14, 'Canon LaserJet', 12, 300.00, 8),
(15, 'Epson EcoTank', 8, 350.00, 8),
(16, 'AMD Ryzen 7', 20, 550.00, 4),
(17, 'Corsair Vengeance', 30, 200.00, 4),
(18, 'HTC Vive Pro', 5, 1500.00, 5),
(19, 'Oculus Quest 2', 8, 1300.00, 5),
(20, 'Netgear Nighthawk', 20, 150.00, 6),
(21, 'TP-Link Archer', 25, 120.00, 6),
(22, 'Adobe Photoshop Subs', 50, 20.00, 7),
(23, 'Microsoft Office 365', 40, 30.00, 7),
(24, 'Razer BlackWidow Key', 18, 110.00, 9),
(25, 'Logitech G Pro Mouse', 22, 90.00, 9);

INSERT INTO `Order` (OrderID, OrderDate, Status, PaymentMethod, Total, TrickingNumber, Discount, UserID) VALUES
('ORD001', NOW(), 'Извършена', 'Кредитна карта', 1500.00, 123, '10%', 'U001'),
('ORD002', NOW(), 'Извършена', 'Пейпал', 900.00, 456, '5%', 'U002'),
('ORD003', NOW(), 'В процес', 'Кредитна карта', 500.00, 789, '0%', 'U003'),
('ORD004', NOW(), 'Извършена', 'Пейпал', 1000.00, 321, '15%', 'U004'),
('ORD005', NOW(), 'В процес', 'Кредитна карта', 700.00, 654, '0%', 'U005'),
('ORD006', NOW(), 'Извършена', 'Кредитна карта', 1550.00, 111, '5%', 'U006'),
('ORD007', NOW(), 'Извършена', 'Пейпал', 1200.00, 222, '10%', 'U007'),
('ORD008', NOW(), 'В процес', 'Кредитна карта', 700.00, 333, '0%', 'U008'),
('ORD009', NOW(), 'Извършена', 'Кредитна карта', 500.00, 444, '15%', 'U009'),
('ORD010', NOW(), 'В процес', 'Пейпал', 1000.00, 555, '20%', 'U010');

DELIMITER //

CREATE PROCEDURE ADD_USER_PROC(
    IN p_UserID VARCHAR(22),
    IN p_Username VARCHAR(22),
    IN p_Password VARCHAR(22),
    IN p_Firstname VARCHAR(22),
    IN p_Lastname VARCHAR(22),
    IN p_Phone INT,
    IN p_Email VARCHAR(40)
)
BEGIN
    INSERT INTO User (UserID, Username, Password, Firstname, Lastname, Phone, Email)
    VALUES (p_UserID, p_Username, p_Password, p_Firstname, p_Lastname, p_Phone, p_Email);
END//

DELIMITER ;


--
-- primer
CALL ADD_USER_PROC('U002', 'jane_doe', 'securePass123', 'Jane', 'Doe', 9876543210, 'jane.doe@example.com');


DELIMITER //

CREATE FUNCTION CalculateDiscountedPrice(
    originalPrice DECIMAL(10, 2),
    discountPercent DECIMAL(5, 2)
) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    RETURN originalPrice - (originalPrice * discountPercent / 100);
END //

DELIMITER ;

-- primer:
SELECT CalculateDiscountedPrice(100.00, 10.00); -- Резултат: 90.00



DELIMITER //

CREATE TRIGGER TrigSetOrderDate
BEFORE INSERT ON `Order`
FOR EACH ROW
BEGIN
    SET NEW.OrderDate = NOW();
END //

DELIMITER ;

