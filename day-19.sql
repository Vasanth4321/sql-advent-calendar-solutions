-- SQL Advent Calendar - Day 19
-- Title: Gift Wrap Paper Usage
-- Difficulty: easy
--
-- Question:
-- Clara is reviewing holiday orders to uncover hidden patterns — can you return the total amount of wrapping paper used for orders that were both gift-wrapped and successfully delivered?
--
-- Clara is reviewing holiday orders to uncover hidden patterns — can you return the total amount of wrapping paper used for orders that were both gift-wrapped and successfully delivered?
--

-- Table Schema:
-- Table: holiday_orders
--   order_id: INT
--   customer_name: VARCHAR
--   gift_wrap: BOOLEAN
--   paper_used_meters: DECIMAL
--   delivery_status: VARCHAR
--   order_date: DATE
--

-- My Solution:

with hidden as (
  select gift_wrap,sum(paper_used_meters) AS total_paper_used 
  from holiday_orders where delivery_status='Delivered' 
  group by gift_wrap order by gift_wrap desc
)
select total_paper_used from hidden limit 1;
