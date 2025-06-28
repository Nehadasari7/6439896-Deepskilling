

-- Create Accounts Table

CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    account_name VARCHAR2(50),
    account_type VARCHAR2(20), -- 'SAVINGS' or 'CURRENT'
    balance NUMBER(12,2)
);


--  Create Employees Table

    employee_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    department_id NUMBER,
    salary NUMBER(12,2)
);


-- Insert Sample Data
-- Accounts
INSERT INTO accounts VALUES (1, 'John Smith', 'SAVINGS', 15000);
INSERT INTO accounts VALUES (2, 'Emma Brown', 'SAVINGS', 10000);
INSERT INTO accounts VALUES (3, 'David Lee', 'CURRENT', 5000);
INSERT INTO accounts VALUES (4, 'Sophia Clark', 'SAVINGS', 8000);

-- Employees
INSERT INTO employees VALUES (101, 'Robert Downey', 10, 50000);
INSERT INTO employees VALUES (102, 'Scarlett Johansson', 20, 60000);
INSERT INTO employees VALUES (103, 'Chris Evans', 10, 55000);

COMMIT;


--  Procedure: ProcessMonthlyInterest

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
    UPDATE accounts
    SET balance = balance + (balance * 0.01)
    WHERE account_type = 'SAVINGS';

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('✅ Monthly interest applied to all savings accounts.');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('❌ Error applying interest: ' || SQLERRM);
END;
/


--  Procedure: UpdateEmployeeBonus

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    dept_id IN NUMBER,
    bonus_percentage IN NUMBER
) AS
BEGIN
    UPDATE employees
    SET salary = salary + (salary * (bonus_percentage / 100))
    WHERE department_id = dept_id;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('⚠️ No employees found in Department ID ' || dept_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('✅ Bonus applied to Department ID ' || dept_id);
    END IF;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('❌ Error updating bonus: ' || SQLERRM);
END;
/


--  Procedure: TransferFunds

CREATE OR REPLACE PROCEDURE TransferFunds (
    from_account_id IN NUMBER,
    to_account_id IN NUMBER,
    amount IN NUMBER
) AS
    insufficient_funds EXCEPTION;
    current_balance NUMBER;
BEGIN
    -- Check sender's balance
    SELECT balance INTO current_balance
    FROM accounts
    WHERE account_id = from_account_id;

    IF current_balance < amount THEN
        RAISE insufficient_funds;
    END IF;

    -- Deduct from sender
    UPDATE accounts
    SET balance = balance - amount
    WHERE account_id = from_account_id;

    -- Add to receiver
    UPDATE accounts
    SET balance = balance + amount
    WHERE account_id = to_account_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('✅ Transferred ' || amount ||
                          ' from Account ' || from_account_id ||
                          ' to Account ' || to_account_id);

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


SELECT * FROM accounts;
SELECT * FROM employees;
