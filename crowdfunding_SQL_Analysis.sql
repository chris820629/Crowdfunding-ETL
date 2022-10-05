-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
select sum(backers_count), cf_id
from campaign
where outcome = 'live'
group by cf_id
order by sum(backers_count) desc


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
select * from backers


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
select ct.first_name, ct.last_name, ct.email, (c.goal-c.pledged) as Remaining_Goal_Amount
from campaign as c
left join contacts as ct
on c.contact_id = ct.contact_id
where c.outcome = 'live'
order by Remaining_Goal_Amount desc



-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
select b.email, b.first_name, b.last_name, b.cf_id, c.company_name, c.description, c.end_date, (c.goal-c.pledged) as Left_of_Goal
from backers as b
left join campaign as c
on b.cf_id = c.cf_id
where c.outcome = 'live'
order by b.last_name, b.email



-- Check the table


