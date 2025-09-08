/* Find a list of order IDs where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table. */

select id
from orders
where gloss_qty > 4000 or poster_qty > 4000;


/* Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000. */

select *
from orders
where standard_qty = 0 and (gloss_qty > 1000 or poster_qty > 1000);


/* Find all the company names that start with a 'C' or 'W', and where the primary contact contains 'ana' or 'Ana', but does not contain 'eana'. */

select name
-- Subquery was used to return company names from an account table that the 'ana', 'Ana' and 'eana' condition
from (
	select *
	from accounts
	-- In other to handle Ana and ana case sensitivity, I introduces ILIKE
	where primary_poc ilike '%ana%' and primary_poc not like '%eana%')
where name like 'C%' or name like 'W%';



/* Provide a table that shows the region for each sales rep along with their associated accounts. Your final table should include three columns: the 
 region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) by account name. */


select r.name, sr.name, a.name
from region r
-- Left join was used in order to return only match from region stable
left join sales_reps sr on r.id = sr.region_id
left join accounts a on sr.id = a.sales_rep_id;
