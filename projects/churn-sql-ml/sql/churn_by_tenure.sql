-- Отток по «возрасту» клиента: когорты по стажу и накопленная доля ушедших
WITH cohorts AS (
    SELECT
        CASE
            WHEN tenure <= 6  THEN '01: 0-6 мес'
            WHEN tenure <= 12 THEN '02: 7-12 мес'
            WHEN tenure <= 24 THEN '03: 1-2 года'
            WHEN tenure <= 48 THEN '04: 2-4 года'
            ELSE                   '05: 4+ года'
        END AS tenure_group,
        churn
    FROM customers
)
SELECT
    tenure_group,
    COUNT(*)                AS customers,
    SUM(churn)              AS churned,
    100.0 * AVG(churn)      AS churn_rate_pct,
    100.0 * SUM(SUM(churn)) OVER (ORDER BY tenure_group)
          / SUM(SUM(churn)) OVER ()  AS cumulative_churned_pct
FROM cohorts
GROUP BY tenure_group
ORDER BY tenure_group;
