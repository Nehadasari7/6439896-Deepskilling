BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE accounts CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE customers CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE employees CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/


-- Create Tables

CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    balance NUMBER
);

CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    salary NUMBER
);

CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    balance NUMBER
);

-- CustomerManagement Package
CREATE OR REPLACE PACKAGE CustomerManagement AS
    PROCEDURE AddCustomer(p_customer_id NUMBER, p_name VARCHAR2, p_balance NUMBER);
    PROCEDURE UpdateCustomer(p_customer_id NUMBER, p_name VARCHAR2);
    FUNCTION GetCustomerBalance(p_customer_id NUMBER) RETURN NUMBER;
END CustomerManagement;
/

CREATE OR REPLACE PACKAGE BODY CustomerManagement AS
    PROCEDURE AddCustomer(p_customer_id NUMBER, p_name VARCHAR2, p_balance NUMBER) IS
    BEGIN
        INSERT INTO customers (customer_id, name, balance)
        VALUES (p_customer_id, p_name, p_balance);
        DBMS_OUTPUT.PUT_LINE('Customer Added: ' || p_name);
    END AddCustomer;

    PROCEDURE UpdateCustomer(p_customer_id NUMBER, p_name VARCHAR2) IS
    BEGIN
        UPDATE customers
        SET name = p_name
        WHERE customer_id = p_customer_id;
        DBMS_OUTPUT.PUT_LINE('Customer Updated: ' || p_name);
    END UpdateCustomer;

    FUNCTION GetCustomerBalance(p_customer_id NUMBER) RETURN NUMBER IS
        v_balance NUMBER;
    BEGIN
        SELECT balance INTO v_balance
        FROM customers
        WHERE customer_id = p_customer_id;
        RETURN v_balance;
    END GetCustomerBalance;
END CustomerManagement;
/

-- EmployeeManagement Package
CREATE OR REPLACE PACKAGE EmployeeManagement AS
    PROCEDURE HireEmployee(p_emp_id NUMBER, p_name VARCHAR2, p_salary NUMBER);
    PROCEDURE UpdateEmployee(p_emp_id NUMBER, p_salary NUMBER);
    FUNCTION CalculateAnnualSalary(p_emp_id NUMBER) RETURN NUMBER;
END EmployeeManagement;
/

CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS
    PROCEDURE HireEmployee(p_emp_id NUMBER, p_name VARCHAR2, p_salary NUMBER) IS
    BEGIN
        INSERT INTO employees (emp_id, name, salary)
        VALUES (p_emp_id, p_name, p_salary);
        DBMS_OUTPUT.PUT_LINE('Employee Hired: ' || p_name);
    END HireEmployee;

    PROCEDURE UpdateEmployee(p_emp_id NUMBER, p_salary NUMBER) IS
    BEGIN
        UPDATE employees
        SET salary = p_salary
        WHERE emp_id = p_emp_id;
        DBMS_OUTPUT.PUT_LINE('Employee Salary Updated');
    END UpdateEmployee;

    FUNCTION CalculateAnnualSalary(p_emp_id NUMBER) RETURN NUMBER IS
        v_salary NUMBER;
    BEGIN
        SELECT salary INTO v_salary
        FROM employees
        WHERE emp_id = p_emp_id;
        RETURN v_salary * 12;
    END CalculateAnnualSalary;
END EmployeeManagement;
/


-- AccountOperations Package

CREATE OR REPLACE PACKAGE AccountOperations AS
    PROCEDURE OpenAccount(p_account_id NUMBER, p_customer_id NUMBER, p_balance NUMBER);
    PROCEDURE CloseAccount(p_account_id NUMBER);
    FUNCTION GetTotalBalance(p_customer_id NUMBER) RETURN NUMBER;
END AccountOperations;
/

CREATE OR REPLACE PACKAGE BODY AccountOperations AS
    PROCEDURE OpenAccount(p_account_id NUMBER, p_customer_id NUMBER, p_balance NUMBER) IS
    BEGIN
        INSERT INTO accounts (account_id, customer_id, balance)
        VALUES (p_account_id, p_customer_id, p_balance);
        DBMS_OUTPUT.PUT_LINE('Account Opened: ' || p_account_id);
    END OpenAccount;

    PROCEDURE CloseAccount(p_account_id NUMBER) IS
    BEGIN
        DELETE FROM accounts
        WHERE account_id = p_account_id;
        DBMS_OUTPUT.PUT_LINE('Account Closed: ' || p_account_id);
    END CloseAccount;

    FUNCTION GetTotalBalance(p_customer_id NUMBER) RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT NVL(SUM(balance), 0)
        INTO v_total
        FROM accounts
        WHERE customer_id = p_customer_id;
        RETURN v_total;
    END GetTotalBalance;
END AccountOperations;
/


-- Sample Usage & Testing
-- Customer
EXEC CustomerManagement.AddCustomer(1, 'John Doe', 5000);
EXEC CustomerManagement.UpdateCustomer(1, 'John Smith');
SELECT CustomerManagement.GetCustomerBalance(1) FROM dual;

-- Employee
EXEC EmployeeManagement.HireEmployee(101, 'Alice', 3000);
EXEC EmployeeManagement.UpdateEmployee(101, 3500);
SELECT EmployeeManagement.CalculateAnnualSalary(101) FROM dual;

-- Account
EXEC AccountOperations.OpenAccount(1001, 1, 7000);
EXEC AccountOperations.CloseAccount(1001);
SELECT AccountOperations.GetTotalBalance(1) FROM dual;
