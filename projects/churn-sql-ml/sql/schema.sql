-- Сырые данные клиентов телеком-оператора (Telco Customer Churn, 7043 строки)
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id        INTEGER PRIMARY KEY,
    gender             TEXT,
    senior_citizen     INTEGER,
    partner            TEXT,
    dependents         TEXT,
    tenure             INTEGER,          -- сколько месяцев клиент с оператором
    phone_service      TEXT,
    multiple_lines     TEXT,
    internet_service   TEXT,
    online_security    TEXT,
    online_backup      TEXT,
    device_protection  TEXT,
    tech_support       TEXT,
    streaming_tv       TEXT,
    streaming_movies   TEXT,
    contract           TEXT,
    paperless_billing  TEXT,
    payment_method     TEXT,
    monthly_charges    REAL,
    total_charges      REAL,             -- NULL у новых клиентов (tenure = 0)
    churn              INTEGER           -- 1 = ушёл
);
