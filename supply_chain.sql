 SUPPLY CHAIN & INVENTORY OPTIMIZATION 



-- =====================================================================
-- Q1: Which departments drive the most revenue and profit?
-
-- =====================================================================
SELECT 
    "Department Name",
    COUNT(DISTINCT "Order Id") AS total_orders,
    ROUND(SUM("Sales per customer"), 2) AS total_revenue,
    ROUND(SUM("Benefit per order"), 2) AS total_profit,
    ROUND(SUM("Benefit per order") * 100.0 / SUM("Sales per customer"), 2) AS profit_margin_pct
FROM cleaned_supply_chain
GROUP BY "Department Name"
ORDER BY total_revenue DESC;


-- 
-- Q2: Which shipping routes and regions suffer from the highest late delivery risk?

-- 
SELECT 
    Market,
    "Order Country",
    COUNT(*) AS total_shipments,
    SUM(Late_delivery_risk) AS delayed_shipments,
    ROUND(SUM(Late_delivery_risk) * 100.0 / COUNT(*), 2) AS delayed_percentage,
    ROUND(AVG("Days for shipping (real)" - "Days for shipment (scheduled)"), 1) AS avg_delay_days
FROM cleaned_supply_chain
GROUP BY Market, "Order Country"
HAVING COUNT(*) > 50  -- Filters out low-volume regions for statistical relevance
ORDER BY delayed_percentage DESC
LIMIT 10;


-- 
-- Q3: How is our revenue distributed across ABC Inventory Tiers?
 
SELECT 
    ABC_Class,
    COUNT(DISTINCT "Product Card Id") AS total_skus,
    ROUND(SUM("Sales per customer"), 2) AS total_revenue_generated,
    ROUND(SUM("Sales per customer") * 100.0 / (SELECT SUM("Sales per customer") FROM cleaned_supply_chain), 2) AS revenue_share_pct
FROM cleaned_supply_chain
GROUP BY ABC_Class
ORDER BY ABC_Class ASC;


-- 
-- Q4: Are high-priced items more prone to shipping delays?
-- 
-- 
SELECT 
    Late_delivery_risk,
    COUNT("Order Id") AS order_count,
    ROUND(AVG("Product Price"), 2) AS avg_product_price,
    ROUND(SUM("Sales per customer"), 2) AS total_sales_volume
FROM cleaned_supply_chain
GROUP BY Late_delivery_risk;


-- 
-- Q5: What are the top 3 best-selling products within each department? (Advanced)
--
-- 
WITH RankedProducts AS (
    SELECT 
        "Department Name",
        "Product Name",
        ROUND(SUM("Sales per customer"), 2) AS total_revenue,
        RANK() OVER (PARTITION BY "Department Name" ORDER BY SUM("Sales per customer") DESC) AS revenue_rank
    FROM cleaned_supply_chain
    GROUP BY "Department Name", "Product Name"
)
SELECT 
    "Department Name",
    "Product Name",
    total_revenue,
    revenue_rank
FROM RankedProducts
WHERE revenue_rank <= 3;


-- 
-- Q6: What is our monthly revenue growth and cumulative running total? (Advanced)
--
-- 
SELECT 
    DATE_TRUNC('month', "Order Date (DateOrders)") AS order_month,
    ROUND(SUM("Sales per customer"), 2) AS monthly_revenue,
    ROUND(SUM(SUM("Sales per customer")) OVER (ORDER BY DATE_TRUNC('month', "Order Date (DateOrders)")), 2) AS running_total_revenue
FROM cleaned_supply_chain
GROUP BY order_month
ORDER BY order_month ASC;
