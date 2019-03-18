# json_insert
inserting json file directly to redshift

#some sql that can be run on the database

The stakeholder wants the message_blast chart to have two new fields: total_emails_clicked and total_emails_opened. How can we provide this information?

select count(opens) as total_emails_opened from message_blast where opens!='null'
union
select count(clicks) as total_emails_clicked from message_blast where clicks!='null'

The stakeholder wants the message_action chart to have two new fields: total_historical_emails_sent and total_historical_emails_opened. How can we provide this information?

select sum("count")as total_historical_emails_sent,sum(total_opens) as total_historical_emails_opened
from profile

One day, we realize that if a user opens/clicks on an email several days after it was sent, their message_blast record is sent again! We have duplicate data in our system. How can we account for this?

"we can solve this by first figuring out duplicates in the table by finding unique values like profile_id and blast_id which is supposed to be unique for each row and then deleting the older entry with no clicks or opens"
delete from message_blast where (profile_id,blast_id) in(
select distinct profile_id,blast_id from message_blast
group by profile_id,blast_id
having count(*)>1)
and opens='null' and clicks='null'

Sometimes if Sailthru's API is delayed then the stakeolder isn't sure if she's looking at the most up-to-date data. How can we remedy this?

Easiest way to solve this is to have extra column in all tables as `dw_added_at current_date();` and then show the max(dw_added_at) column
in the dashboard. This will represent the last time a data was inserted into the table.
