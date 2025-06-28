

--  Create Customers Table

CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    age NUMBER,
    loan_interest_rate NUMBER(5,2),
    balance NUMBER(12,2),
    isVIP VARCHAR2(5)
);


--  Create Accounts Table

CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    account_name VARCHAR2(50),
    balance NUMBER(12,2)
);


-- Create Employees Table

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    salary NUMBER(12,2)
);


--  Insert Sample Data

-- Customers
INSERT INTO customers VALUES (1, 'John Smith', 65, 8.5, 12000, 'FALSE');
INSERT INTO customers VALUES (2, 'Emma Brown', 45, 9.0, 8000, 'FALSE');
INSERT INTO customers VALUES (3, 'David Lee', 70, 7.5, 15000, 'FALSE');
INSERT INTO customers VALUES (4, 'Sophia Clark', 55, 10.0, 5000, 'FALSE');
INSERT INTO customers VALUES (5, 'Michael Green', 62, 8.0, 9500, 'FALSE');

-- Accounts
INSERT INTO accounts VALUES (1, 'John Smith', 15000);
INSERT INTO accounts VALUES (2, 'Emma Brown', 10000);
INSERT INTO accounts VALUES (3, 'David Lee', 5000);

-- Employees
INSERT INTO employees VALUES (101, 'Robert Downey', 50000);
INSERT INTO employees VALUES (102, 'Scarlett Johansson', 60000);
INSERT INTO employees VALUES (103, 'Chris Evans', 55000);

COMMIT;


--  Procedure: SafeTransferFunds
CREATE OR REPLACE PROCEDURE SafeTransferFunds (
    from_account_id IN NUMBER,
    to_account_id IN NUMBER,
    amount IN NUMBER
) AS
    insufficient_funds EXCEPTION;
    current_balance NUMBER;
BEGIN
    SELECT balance INTO current_balance FROM accounts WHERE account_id = from_account_id;

    IF current_balance < amount THEN
        RAISE insufficient_funds;
    END IF;

    UPDATE accounts
    SET balance = balance - amount
    WHERE account_id = from_account_id;

    UPDATE accounts
    SET balance = balance + amount
    WHERE account_id = to_account_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('✅ Transfer successful from Account ' || from_account_id || ' to ' || to_account_id);

EXCEPTION
    WHEN insufficient_funds THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('❌ Transfer failed: Insufficient funds in Account ' || from_account_id);
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('❌ Transfer failed: One or both account IDs do not exist.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('❌ Transfer failed: ' || SQLERRM);
END;
/


--  Procedure: UpdateSalary

CREATE OR REPLACE PROCEDURE UpdateSalary (
    emp_id IN NUMBER,
    percentage IN NUMBER
) AS
BEGIN
    UPDATE employees
    SET salary = salary + (salary * (percentage / 100))
    WHERE employee_id = emp_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Employee ID does not exist');
    END IF;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('✅ Salary updated for Employee ID ' || emp_id);

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('❌ Error updating salary: ' || SQLERRM);
END;
/


--  Procedure: AddNewCustomer

CREATE OR REPLACE PROCEDURE AddNewCustomer (
    cust_id IN NUMBER,
    name IN VARCHAR2,
    age IN NUMBER,
    loan_interest_rate IN NUMBER,
    balance IN NUMBER,
    isVIP IN VARCHAR2
) AS
BEGIN
    INSERT INTO customers (customer_id, name, age, loan_interest_rate, balance, isVIP)
    VALUES (cust_id, name, age, loan_interest_rate, balance, isVIP);

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('✅ Customer added successfully with ID ' || cust_id);

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('❌ Customer ID ' || cust_id || ' already exists. Cannot insert.');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('❌ Error inserting customer: ' || SQLERRM);
END;
/


SELECT * FROM accounts;
SELECT * FROM employees;
