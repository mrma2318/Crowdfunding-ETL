-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT cf_id, 
    backers_count
FROM campaign
WHERE (outcome = 'live')
ORDER BY backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT COUNT(cf_id), cf_id
FROM backers
GROUP BY cf_id
ORDER BY COUNT (cf_id) DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT contacts.first_name,
    contacts.last_name,
    contacts.email,
    (campaign.goal - campaign.pledged) AS amount_left
INTO remain_amount
FROM campaign
INNER JOIN contacts
ON (campaign.contact_id = contacts.contact_id)
WHERE (outcome = 'live')
ORDER BY (campaign.goal - campaign.pledged) DESC;


-- Check the table

SELECT * FROM remain_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT contacts.first_name,
    contacts.last_name,
    contacts.email,
    campaign.company_name,
    campaign.cf_id,
    campaign.description,
    campaing.end_date,
    (campaign.goal - campaign.pledged) AS left_of_goal
INTO email_backers_remaining_goal_amount
FROM campaign
INNER JOIN contacts
ON (campaign.contact_id = contacts.contact_id)
WHERE (outcome = 'live')
ORDER BY (campaign.goal - campaign.pledged) DESC;

-- Check the table

SELECT * FROM email_backers_remaining_goal_amount
