-- Scenario 1: CalculateAge Function
CREATE OR REPLACE FUNCTION CalculateAge (dob DATE)
RETURN NUMBER
IS
    age NUMBER;
BEGIN
    age := FLOOR(MONTHS_BETWEEN(SYSDATE, dob) / 12);
    RETURN age;
END;
/

-- Scenario 2: CalculateMonthlyInstallment Function
CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment (
    loan_amount NUMBER,
    annual_interest_rate NUMBER,
    duration_years NUMBER
)
RETURN NUMBER
IS
    monthly_rate NUMBER;
    total_months NUMBER;
    emi NUMBER;
BEGIN
    -- Convert annual interest rate to monthly rate (in decimal)
    monthly_rate := annual_interest_rate / (12 * 100);
    total_months := duration_years * 12;

    -- EMI formula
    emi := (loan_amount * monthly_rate * POWER(1 + monthly_rate, total_months)) /
           (POWER(1 + monthly_rate, total_months) - 1);

    RETURN ROUND(emi, 2);
END;
/

-- Scenario 3: HasSufficientBalance Function

CREATE OR REPLACE FUNCTION HasSufficientBalance (
    acc_id NUMBER,
    amount NUMBER
)
RETURN BOOLEAN
IS
    bal NUMBER;
BEGIN
    SELECT balance INTO bal FROM accounts WHERE account_id = acc_id;

    IF bal >= amount THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;
/

