-- Витрина признаков для модели: всё считается в SQL, Python получает готовую таблицу
DROP VIEW IF EXISTS customer_features;
CREATE VIEW customer_features AS
SELECT
    customer_id,
    tenure,
    monthly_charges,
    COALESCE(total_charges, 0)                                   AS total_charges,
    COALESCE(total_charges, 0) / NULLIF(tenure, 0)               AS avg_monthly_spend,
    monthly_charges - COALESCE(total_charges / NULLIF(tenure, 0), monthly_charges) AS charge_growth,
    senior_citizen,
    CASE WHEN partner    = 'Yes' THEN 1 ELSE 0 END               AS has_partner,
    CASE WHEN dependents = 'Yes' THEN 1 ELSE 0 END               AS has_dependents,
    CASE WHEN paperless_billing = 'Yes' THEN 1 ELSE 0 END        AS paperless_billing,
    -- число подключённых доп. услуг
      CASE WHEN online_security   = 'Yes' THEN 1 ELSE 0 END
    + CASE WHEN online_backup     = 'Yes' THEN 1 ELSE 0 END
    + CASE WHEN device_protection = 'Yes' THEN 1 ELSE 0 END
    + CASE WHEN tech_support      = 'Yes' THEN 1 ELSE 0 END
    + CASE WHEN streaming_tv      = 'Yes' THEN 1 ELSE 0 END
    + CASE WHEN streaming_movies  = 'Yes' THEN 1 ELSE 0 END      AS n_addons,
    CASE WHEN online_security = 'Yes' OR tech_support = 'Yes' THEN 1 ELSE 0 END AS has_support,
    contract,
    internet_service,
    payment_method,
    multiple_lines,
    churn
FROM customers;
