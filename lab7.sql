-- 2
CREATE ROLE accountant;
CREATE ROLE administrator;
CREATE ROLE support;

GRANT ALL PRIVILEGES on accounts to accountant;
GRANT SELECT on transactions to accountant;
GRANT SELECT on customers to accountant;

GRANT ALL PRIVILEGES on accounts,transactions,customers to administrator;

GRANT SELECT on accounts,transactions,customers to support;

CREATE user u1;
GRANT administrator to u1;
CREATE user u2;
GRANT accountant to u2;
CREATE user u3;
GRANT support to u3;
CREATE user u4;
GRANT administrator to u4;
CREATE user u5;
GRANT support to u5;

CREATE ROLE changer CREATEROLE;
GRANT changer to u1;

REVOKE ALL PRIVILEGES on accounts,transactions,customers FROM u5;
REVOKE UPDATE on accounts FROM u4;

-- 3.2

ALTER TABLE transactions
    ALTER COLUMN date SET NOT NULL,
    ALTER COLUMN src_account SET NOT NULL,
    ALTER COLUMN dst_account SET NOT NULL,
    ALTER COLUMN amount SET NOT NULL,
    ALTER COLUMN status SET NOT NULL;

-- 4

CREATE DOMAIN Money1 char(50);
ALTER TABLE accounts
    ALTER COLUMN currency TYPE Money1;

-- 5

CREATE UNIQUE INDEX cus_to_cur on accounts (account_id, customer_id, currency);
CREATE INDEX cur_to_bal on accounts (account_id, currency, balance);

-- 6

BEGIN;
INSERT INTO transactions VALUES (4, '2021-11-13 13:24:00', 'AB10203', 'NK90123', 50, 'init');
UPDATE accounts SET balance = balance - 50 WHERE account_id = 'AB10203';
UPDATE accounts SET balance = balance + 50 WHERE account_id = 'NK90123';
UPDATE transactions SET status = 'commit' FROM accounts WHERE (account_id = 'AB10203' AND balance > accounts.limit) AND (account_id = 'NK90123' AND balance > accounts.limit);
COMMIT;