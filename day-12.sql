-- SQL Advent Calendar - Day 12
-- Title: North Pole Network Most Active Users
-- Difficulty: hard
--
-- Question:
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--

-- Table Schema:
-- Table: npn_users
--   user_id: INT
--   user_name: VARCHAR
--
-- Table: npn_messages
--   message_id: INT
--   sender_id: INT
--   sent_at: TIMESTAMP
--

-- My Solution:

with counts as (
  select u.user_name, date(m.sent_at) as m_date, 
  count(m.message_id) as m_count from npn_messages m 
  join npn_users u on m.sender_id=u.user_id
group by u.user_name,m_date 
  ),
ranks as (
  select user_name,m_date, m_count, rank() over 
  (partition by m_date order by m_count desc) as rank
  from counts
)
select user_name, m_date, m_count from ranks where rank=1;
