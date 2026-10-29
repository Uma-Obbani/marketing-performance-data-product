-- Marketing Performance Data Product
-- Dataset: Synthetic campaign performance data
-- Grain: One row per campaign, region and reporting week

SELECT
    week_start,
    channel,
    campaign_id,
    campaign_name,
    region,
    SUM(spend_eur) AS marketing_spend_eur,
    SUM(conversions) AS total_conversions,
    SUM(attributed_revenue_eur) AS attributed_revenue_eur,
    ROUND(
        SUM(attributed_revenue_eur) / NULLIF(SUM(spend_eur), 0),
        2
    ) AS roas
FROM campaign_performance
GROUP BY
    week_start,
    channel,
    campaign_id,
    campaign_name,
    region
ORDER BY
    week_start,
    region,
    roas DESC;