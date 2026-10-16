-- Отток и выручка в зоне риска по типу контракта
SELECT
    contract,
    COUNT(*)                                        AS customers,
    SUM(churn)                                      AS churned,
    100.0 * AVG(churn)                              AS churn_rate_pct,
    SUM(CASE WHEN churn = 1 THEN monthly_charges ELSE 0 END) AS lost_mrr,
    100.0 * SUM(CASE WHEN churn = 1 THEN monthly_charges ELSE 0 END)
          / SUM(SUM(CASE WHEN churn = 1 THEN monthly_charges ELSE 0 END)) OVER () AS share_of_lost_mrr_pct
FROM customers
GROUP BY contract
ORDER BY churn_rate_pct DESC;
