CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    age NUMBER,
    loan_interest_rate NUMBER(5,2),
    balance NUMBER(12,2),
    isVIP VARCHAR2(5) -- 'TRUE' or 'FALSE'
);


INSERT INTO customers VALUES (1, 'John Smith', 65, 8.5, 12000, 'FALSE');
INSERT INTO customers VALUES (2, 'Emma Brown', 45, 9.0, 8000, 'FALSE');
INSERT INTO customers VALUES (3, 'David Lee', 70, 7.5, 15000, 'FALSE');
INSERT INTO customers VALUES (4, 'Sophia Clark', 55, 10.0, 5000, 'FALSE');
INSERT INTO customers VALUES (5, 'Michael Green', 62, 8.0, 9500, 'FALSE');

COMMIT;



CREATE TABLE loans (
    loan_id NUMBER PRIMARY KEY,
    customer_id NUMBER REFERENCES customers(customer_id),
    loan_amount NUMBER(12,2),
    due_date DATE
);


INSERT INTO loans VALUES (101, 1, 50000, SYSDATE + 10); -- Due in 10 days
INSERT INTO loans VALUES (102, 2, 30000, SYSDATE + 40); -- Due in 40 days
INSERT INTO loans VALUES (103, 3, 45000, SYSDATE + 5);  -- Due in 5 days
INSERT INTO loans VALUES (104, 4, 20000, SYSDATE + 25); -- Due in 25 days
INSERT INTO loans VALUES (105, 5, 35000, SYSDATE + 60); -- Due in 60 days

COMMIT;


BEGIN
    FOR cust_rec IN (SELECT customer_id, loan_interest_rate, age FROM customers) LOOP
        IF cust_rec.age > 60 THEN
            UPDATE customers
            SET loan_interest_rate = loan_interest_rate - 1
            WHERE customer_id = cust_rec.customer_id;

            DBMS_OUTPUT.PUT_LINE('1% discount applied to Customer ID: ' || cust_rec.customer_id);
        END IF;
    END LOOP;
    COMMIT;
END;
/


BEGIN
    FOR cust_rec IN (SELECT customer_id, balance FROM customers) LOOP
        IF cust_rec.balance > 10000 THEN
            UPDATE customers
            SET isVIP = 'TRUE'
            WHERE customer_id = cust_rec.customer_id;

            DBMS_OUTPUT.PUT_LINE('Customer ID ' || cust_rec.customer_id || ' promoted to VIP.');
        END IF;
    END LOOP;
    COMMIT;
END;
/


BEGIN
    FOR loan_rec IN (
        SELECT loan_id, customer_id, due_date 
        FROM loans 
        WHERE due_date BETWEEN SYSDATE AND SYSDATE + 30
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Loan ID ' || loan_rec.loan_id || 
            ' for Customer ID ' || loan_rec.customer_id ||
            ' is due on ' || TO_CHAR(loan_rec.due_date, 'DD-MON-YYYY')
        );
    END LOOP;
END;
/


SELECT * FROM customers;


SELECT * FROM loans;
