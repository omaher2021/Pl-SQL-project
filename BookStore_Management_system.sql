--Project Name:- BookStore Management System

--Query for creating the book table
CREATE TABLE Books (
    BookID NUMBER PRIMARY KEY,
    Title VARCHAR2(100),
    Author VARCHAR2(100),
    Genre VARCHAR2(50),
    Price NUMBER(8, 2),
    Stock NUMBER
);
--insert query for books in books table
INSERT INTO Books (BookID, Title, Author, Genre, Price, Stock) VALUES
(1, 'The White Tiger', 'Aravind Adiga', 'Fiction', 399.99, 50);

INSERT INTO Books (BookID, Title, Author, Genre, Price, Stock) VALUES
(2, 'India After Gandhi', 'Ramachandra Guha', 'History', 899.99, 30);

INSERT INTO Books (BookID, Title, Author, Genre, Price, Stock) VALUES
(3, 'The Guide', 'R.K. Narayan', 'Fiction', 299.99, 40);

INSERT INTO Books (BookID, Title, Author, Genre, Price, Stock) VALUES
(4, 'Wings of Fire', 'A.P.J. Abdul Kalam', 'Autobiography', 499.99, 25);

INSERT INTO Books (BookID, Title, Author, Genre, Price, Stock) VALUES
(5, 'Ignited Minds', 'A.P.J. Abdul Kalam', 'Self-Help', 399.99, 20);

INSERT INTO Books (BookID, Title, Author, Genre, Price, Stock) VALUES
(6, 'The God of Small Things', 'Arundhati Roy', 'Fiction', 599.99, 100);

INSERT INTO Books (BookID, Title, Author, Genre, Price, Stock) VALUES
(7, 'An Era of Darkness', 'Shashi Tharoor', 'History', 699.99, 15);

INSERT INTO Books (BookID, Title, Author, Genre, Price, Stock) VALUES
(8, 'Train to Pakistan', 'Khushwant Singh', 'Historical Fiction', 349.99, 35);

--print data form book table
select * from Books;


--Query for creating the Customer details table
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Email VARCHAR2(100),
    Phone VARCHAR2(15)
);

--insert query for customer details 
INSERT INTO Customers (CustomerID, Name, Email, Phone) VALUES
(1, 'Amit Sharma', 'amit.sharma@example.in', '9876543210');

INSERT INTO Customers (CustomerID, Name, Email, Phone) VALUES
(2, 'Priya Patel', 'priya.patel@example.in', '8765432109');

INSERT INTO Customers (CustomerID, Name, Email, Phone) VALUES
(3, 'Rahul Verma', 'rahul.verma@example.in', '7654321098');

INSERT INTO Customers (CustomerID, Name, Email, Phone) VALUES
(4, 'Anjali Mehta', 'anjali.mehta@example.in', '6543210987');

INSERT INTO Customers (CustomerID, Name, Email, Phone) VALUES
(5, 'Vikram Singh', 'vikram.singh@example.in', '5432109876');

INSERT INTO Customers (CustomerID, Name, Email, Phone) VALUES
(6, 'Neha Gupta', 'neha.gupta@example.in', '4321098765');

INSERT INTO Customers (CustomerID, Name, Email, Phone) VALUES
(7, 'Arjun Nair', 'arjun.nair@example.in', '3210987654');

INSERT INTO Customers (CustomerID, Name, Email, Phone) VALUES
(8, 'Riya Choudhary', 'riya.choudhary@example.in', '2109876543');

--print data form Customer table
select * from Customers;


--create table for orders
CREATE TABLE Orders (
    OrderID NUMBER PRIMARY KEY,
    CustomerID NUMBER REFERENCES Customers(CustomerID),
    OrderDate DATE DEFAULT SYSDATE
);
--inserting data into orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1, 1, TO_DATE('2025-01-01', 'YYYY-MM-DD'));

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(2, 2, TO_DATE('2025-01-02', 'YYYY-MM-DD'));

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(3, 3, TO_DATE('2025-01-03', 'YYYY-MM-DD'));

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(4, 4, TO_DATE('2025-01-04', 'YYYY-MM-DD'));

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(5, 5, TO_DATE('2025-01-05', 'YYYY-MM-DD'));

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(6, 6, TO_DATE('2025-01-06', 'YYYY-MM-DD'));

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(7, 7, TO_DATE('2025-01-07', 'YYYY-MM-DD'));

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(8, 8, TO_DATE('2025-01-08', 'YYYY-MM-DD'));

--print data from orders
select * from Orders;

--create table for OrderDetails
CREATE TABLE OrderDetails (
    OrderDetailID NUMBER PRIMARY KEY,
    OrderID NUMBER REFERENCES Orders(OrderID),
    BookID NUMBER REFERENCES Books(BookID),
    Quantity NUMBER,
    TotalPrice NUMBER(8, 2)
);

-- insert the data in orderDetail table
INSERT INTO OrderDetails (OrderDetailID, OrderID, BookID, Quantity, TotalPrice) VALUES
(1, 1, 1, 2, 799.98);
INSERT INTO OrderDetails (OrderDetailID, OrderID, BookID, Quantity, TotalPrice) VALUES
(2, 1, 3, 1, 299.99);
INSERT INTO OrderDetails (OrderDetailID, OrderID, BookID, Quantity, TotalPrice) VALUES
(3, 2, 2, 1, 899.99);
INSERT INTO OrderDetails (OrderDetailID, OrderID, BookID, Quantity, TotalPrice) VALUES
(4, 3, 4, 1, 499.99);
INSERT INTO OrderDetails (OrderDetailID, OrderID, BookID, Quantity, TotalPrice) VALUES
(5, 4, 6, 3, 1799.97);
INSERT INTO OrderDetails (OrderDetailID, OrderID, BookID, Quantity, TotalPrice) VALUES
(6, 5, 8, 1, 349.99); 

--query for print data from orderDetail table
select * from OrderDetails;


---(1)--
--create procedure for add book in book table
CREATE OR REPLACE PROCEDURE AddBook (
    p_BookID IN NUMBER,
    p_Title IN VARCHAR2,
    p_Author IN VARCHAR2,
    p_Genre IN VARCHAR2,
    p_Price IN NUMBER,
    p_Stock IN NUMBER
) AS
BEGIN
    INSERT INTO Books (BookID, Title, Author, Genre, Price, Stock)
    VALUES (p_BookID, p_Title, p_Author, p_Genre, p_Price, p_Stock);
    DBMS_OUTPUT.PUT_LINE('Book added successfully.');
END;
/

BEGIN
    AddBook(9, 'Gitanjali', 'Rabindranath Tagore', 'Poetry', 299.99, 20);
END;
/

select *from Books;


---(2)--
--Update Book Price Procedure
CREATE OR REPLACE PROCEDURE UpdateBookPrice (
    p_BookID IN NUMBER,
    p_NewPrice IN NUMBER
) AS
BEGIN
    UPDATE Books
    SET Price = p_NewPrice
    WHERE BookID = p_BookID;
    DBMS_OUTPUT.PUT_LINE('Book price updated successfully.');
END;
/

BEGIN
    UpdateBookPrice(1, 450.00); 
END;
/

select * from Books;


--(3)--
--Delete Book Procedure
CREATE OR REPLACE PROCEDURE DeleteBook (
    p_BookID IN NUMBER
) AS
BEGIN
    DELETE FROM Books
    WHERE BookID = p_BookID;
    DBMS_OUTPUT.PUT_LINE('Book deleted successfully.');
END;
/

BEGIN
    DeleteBook(9); 
END;
/

select * from books;


--(4)--
--Add Customer Procedure
CREATE OR REPLACE PROCEDURE AddCustomer (
    p_CustomerID IN NUMBER,
    p_Name IN VARCHAR2,
    p_Email IN VARCHAR2,
    p_Phone IN VARCHAR2
) AS
BEGIN
    INSERT INTO Customers (CustomerID, Name, Email, Phone)
    VALUES (p_CustomerID, p_Name, p_Email, p_Phone);
    DBMS_OUTPUT.PUT_LINE('Customer added successfully.');
END;
/

BEGIN
    AddCustomer(9, 'Shreya Roy', 'shreya.roy@example.in', '1234567890');
END;
/

select * from Customers;


--(5)--
--Add Order Procedure
CREATE OR REPLACE PROCEDURE AddOrder (
    p_OrderID IN NUMBER,
    p_CustomerID IN NUMBER,
    p_OrderDate IN DATE
) AS
BEGIN
    INSERT INTO Orders (OrderID, CustomerID, OrderDate)
    VALUES (p_OrderID, p_CustomerID, p_OrderDate);
    DBMS_OUTPUT.PUT_LINE('Order added successfully.');
END;
/

BEGIN
    AddOrder(9, 9, TO_DATE('2025-01-09', 'YYYY-MM-DD'));
END;
/

select * from orders;

--(6)--
--Add Order Detail Procedure
CREATE OR REPLACE PROCEDURE AddOrderDetail (
    p_OrderDetailID IN NUMBER,
    p_OrderID IN NUMBER,
    p_BookID IN NUMBER,
    p_Quantity IN NUMBER,
    p_TotalPrice IN NUMBER
) AS
BEGIN
    INSERT INTO OrderDetails (OrderDetailID, OrderID, BookID, Quantity, TotalPrice)
    VALUES (p_OrderDetailID, p_OrderID, p_BookID, p_Quantity, p_TotalPrice);
    DBMS_OUTPUT.PUT_LINE('Order detail added successfully.');
END;
/

BEGIN
    AddOrderDetail(7, 9, 3, 2, 599.98);
END;
/

select * from OrderDetails;


--(7)--
--Function to Get Total Stock for a Book
CREATE OR REPLACE FUNCTION GetBookStock (
    p_BookID IN NUMBER
) RETURN NUMBER AS
    v_Stock NUMBER;
BEGIN
    SELECT Stock INTO v_Stock
    FROM Books
    WHERE BookID = p_BookID;
    RETURN v_Stock;
END;
/

DECLARE
    v_Stock NUMBER;
BEGIN
    v_Stock := GetBookStock(1); 
    DBMS_OUTPUT.PUT_LINE('Stock: ' || v_Stock);
END;
/

select * from Books;

--(8)--
--Function to Calculate Total Orders for a Customer
CREATE OR REPLACE FUNCTION GetTotalOrders (
    p_CustomerID IN NUMBER
) RETURN NUMBER AS
    v_TotalOrders NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_TotalOrders
    FROM Orders
    WHERE CustomerID = p_CustomerID;
    RETURN v_TotalOrders;
END;
/

DECLARE
    v_TotalOrders NUMBER;
BEGIN
    v_TotalOrders := GetTotalOrders(1); -- Get total orders for Amit Sharma
    DBMS_OUTPUT.PUT_LINE('Total Orders: ' || v_TotalOrders);
END;
/

select * from orders;

--(9)--
--Trigger: Update Stock After Adding Order Details
CREATE OR REPLACE TRIGGER UpdateStockAfterOrder
AFTER INSERT ON OrderDetails
FOR EACH ROW
DECLARE
    v_Stock NUMBER;
BEGIN
   
    SELECT Stock INTO v_Stock
    FROM Books
    WHERE BookID = :NEW.BookID;

    -- Check if stock is sufficient
    IF v_Stock >= :NEW.Quantity THEN
        -- Update stock
        UPDATE Books
        SET Stock = Stock - :NEW.Quantity
        WHERE BookID = :NEW.BookID;
    ELSE
        -- Raise an error if stock is insufficient
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient stock for the book with ID: ' || :NEW.BookID);
    END IF;
END;
/

SELECT * FROM Books WHERE BookID = 1;


