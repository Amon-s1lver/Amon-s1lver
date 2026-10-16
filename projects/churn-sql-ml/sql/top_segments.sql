-- Самые «рискованные» сегменты: контракт x интернет x способ оплаты (не меньше 100 клиентов)
SELECT *
FROM (
    SELECT
        contract,
        internet_service,
        payment_method,
        COUNT(*)            AS customers,
        100.0 * AVG(churn)  AS churn_rate_pct,
        RANK() OVER (ORDER BY AVG(churn) DESC) AS risk_rank
    FROM customers
    GROUP BY contract, internet_service, payment_method
    HAVING COUNT(*) >= 100
) ranked
WHERE risk_rank <= 5
ORDER BY risk_rank;
