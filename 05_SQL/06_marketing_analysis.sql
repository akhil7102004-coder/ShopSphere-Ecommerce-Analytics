USE shopsphere;

SELECT
    channel,
    COUNT(*) AS campaigns
FROM marketing_campaigns
GROUP BY channel
ORDER BY campaigns DESC;

SELECT
    channel,
    ROUND(SUM(spend_inr), 2) AS total_spend
FROM marketing_campaigns
GROUP BY channel
ORDER BY total_spend DESC;

SELECT
    channel,
    SUM(impressions) AS total_impressions
FROM marketing_campaigns
GROUP BY channel
ORDER BY total_impressions DESC;

SELECT
    channel,
    SUM(clicks) AS total_clicks
FROM marketing_campaigns
GROUP BY channel
ORDER BY total_clicks DESC;

SELECT
    channel,
    SUM(conversions) AS total_conversions
FROM marketing_campaigns
GROUP BY channel
ORDER BY total_conversions DESC;

SELECT
    channel,
    ROUND(SUM(revenue_attributed_inr), 2) AS attributed_revenue
FROM marketing_campaigns
GROUP BY channel
ORDER BY attributed_revenue DESC;

SELECT
    channel,
    ROUND(SUM(spend_inr), 2) AS total_spend,
    ROUND(SUM(revenue_attributed_inr), 2) AS attributed_revenue,
    ROUND(
        SUM(revenue_attributed_inr) /
        NULLIF(SUM(spend_inr), 0),
        2
    ) AS roas
FROM marketing_campaigns
GROUP BY channel
ORDER BY roas DESC;

SELECT
    channel,
    ROUND(SUM(spend_inr), 2) AS total_spend,
    SUM(conversions) AS conversions,
    ROUND(
        SUM(spend_inr) /
        NULLIF(SUM(conversions), 0),
        2
    ) AS cost_per_conversion
FROM marketing_campaigns
GROUP BY channel
ORDER BY cost_per_conversion;

SELECT
    channel,
    SUM(impressions) AS impressions,
    SUM(clicks) AS clicks,
    ROUND(
        SUM(clicks) * 100.0 /
        NULLIF(SUM(impressions), 0),
        2
    ) AS ctr_pct
FROM marketing_campaigns
GROUP BY channel
ORDER BY ctr_pct DESC;

SELECT
    channel,
    SUM(clicks) AS clicks,
    SUM(conversions) AS conversions,
    ROUND(
        SUM(conversions) * 100.0 /
        NULLIF(SUM(clicks), 0),
        2
    ) AS conversion_rate_pct
FROM marketing_campaigns
GROUP BY channel
ORDER BY conversion_rate_pct DESC;

SELECT
    COUNT(*) AS total_campaigns,
    ROUND(SUM(spend_inr), 2) AS total_spend,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    SUM(conversions) AS total_conversions,
    ROUND(SUM(revenue_attributed_inr), 2) AS attributed_revenue,
    ROUND(
        SUM(revenue_attributed_inr) /
        NULLIF(SUM(spend_inr), 0),
        2
    ) AS overall_roas
FROM marketing_campaigns;

SELECT
    DATE_FORMAT(campaign_date, '%Y-%m') AS campaign_month,
    ROUND(SUM(spend_inr), 2) AS spend,
    SUM(conversions) AS conversions,
    ROUND(SUM(revenue_attributed_inr), 2) AS attributed_revenue
FROM marketing_campaigns
GROUP BY DATE_FORMAT(campaign_date, '%Y-%m')
ORDER BY campaign_month;

SELECT
    campaign_id,
    campaign_name,
    channel,
    ROUND(spend_inr, 2) AS spend,
    impressions,
    clicks,
    conversions,
    ROUND(revenue_attributed_inr, 2) AS attributed_revenue,
    ROUND(
        revenue_attributed_inr /
        NULLIF(spend_inr, 0),
        2
    ) AS roas
FROM marketing_campaigns
ORDER BY roas DESC
LIMIT 20;

SELECT
    campaign_id,
    campaign_name,
    channel,
    ROUND(
        clicks * 100.0 /
        NULLIF(impressions, 0),
        2
    ) AS ctr_pct,
    ROUND(
        conversions * 100.0 /
        NULLIF(clicks, 0),
        2
    ) AS conversion_rate_pct,
    ROUND(
        spend_inr /
        NULLIF(conversions, 0),
        2
    ) AS cost_per_conversion
FROM marketing_campaigns
ORDER BY conversion_rate_pct DESC
LIMIT 20;

SELECT
    channel,
    COUNT(*) AS campaigns,
    ROUND(SUM(spend_inr), 2) AS spend,
    SUM(impressions) AS impressions,
    SUM(clicks) AS clicks,
    SUM(conversions) AS conversions,
    ROUND(SUM(revenue_attributed_inr), 2) AS revenue,
    ROUND(
        SUM(clicks) * 100.0 /
        NULLIF(SUM(impressions), 0),
        2
    ) AS ctr_pct,
    ROUND(
        SUM(conversions) * 100.0 /
        NULLIF(SUM(clicks), 0),
        2
    ) AS conversion_rate_pct,
    ROUND(
        SUM(revenue_attributed_inr) /
        NULLIF(SUM(spend_inr), 0),
        2
    ) AS roas
FROM marketing_campaigns
GROUP BY channel
ORDER BY roas DESC;

SELECT
    COUNT(*) AS campaigns,
    ROUND(SUM(spend_inr), 2) AS total_spend,
    SUM(impressions) AS impressions,
    SUM(clicks) AS clicks,
    SUM(conversions) AS conversions,
    ROUND(SUM(revenue_attributed_inr), 2) AS attributed_revenue,
    ROUND(
        SUM(clicks) * 100.0 /
        NULLIF(SUM(impressions), 0),
        2
    ) AS ctr_pct,
    ROUND(
        SUM(conversions) * 100.0 /
        NULLIF(SUM(clicks), 0),
        2
    ) AS conversion_rate_pct,
    ROUND(
        SUM(revenue_attributed_inr) /
        NULLIF(SUM(spend_inr), 0),
        2
    ) AS roas
FROM marketing_campaigns;

