CREATE TABLE transactions (
    transaction_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    amount NUMBER,
    transaction_date DATE
);

CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    balance NUMBER
);

CREATE TABLE loans (
    loan_id NUMBER PRIMARY KEY,
    interest_rate NUMBER
);
-- Accounts
INSERT INTO accounts VALUES (1, 10000);
INSERT INTO accounts VALUES (2, 15000);
INSERT INTO accounts VALUES (3, 20000);

-- Loans
INSERT INTO loans VALUES (1, 7.5);
INSERT INTO loans VALUES (2, 6.0);
INSERT INTO loans VALUES (3, 8.0);

-- Transactions
INSERT INTO transactions VALUES (101, 1, 5000, SYSDATE);
INSERT INTO transactions VALUES (102, 2, 3000, SYSDATE - 5); -- 5 days ago
INSERT INTO transactions VALUES (103, 3, 7000, ADD_MONTHS(SYSDATE, -1)); -- 1 month ago

COMMIT;
BEGIN
    DBMS_OUTPUT.PUT_LINE('---- Monthly Statements ----');
    FOR txn_rec IN (
        SELECT customer_id, transaction_id, amount, transaction_date
        FROM transactions
        WHERE EXTRACT(MONTH FROM transaction_date) = EXTRACT(MONTH FROM SYSDATE)
          AND EXTRACT(YEAR FROM transaction_date) = EXTRACT(YEAR FROM SYSDATE)
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || txn_rec.customer_id ||
                              ', Transaction ID: ' || txn_rec.transaction_id ||
                              ', Amount: ' || txn_rec.amount ||
                              ', Date: ' || TO_CHAR(txn_rec.transaction_date, 'YYYY-MM-DD'));
    END LOOP;
END;
/
DECLARE
    annual_fee CONSTANT NUMBER := 500;
BEGIN
    DBMS_OUTPUT.PUT_LINE('---- Applying Annual Fee ----');
    FOR acc_rec IN (
        SELECT account_id, balance FROM accounts
    ) LOOP
        UPDATE accounts
        SET balance = balance - annual_fee
        WHERE account_id = acc_rec.account_id;

        DBMS_OUTPUT.PUT_LINE('Annual fee applied to Account ID: ' || acc_rec.account_id);
    END LOOP;

    COMMIT;
END;
/
DECLARE
    interest_increment CONSTANT NUMBER := 0.5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('---- Updating Loan Interest Rates ----');
    FOR loan_rec IN (
        SELECT loan_id, interest_rate FROM loans
    ) LOOP
        UPDATE loans
        SET interest_rate = loan_rec.interest_rate + interest_increment
        WHERE loan_id = loan_rec.loan_id;

        DBMS_OUTPUT.PUT_LINE('Loan ID: ' || loan_rec.loan_id ||
                              ' - New Interest Rate: ' || (loan_rec.interest_rate + interest_increment));
    END LOOP;

    COMMIT;
END;
/
