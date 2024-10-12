select first_name, last_name, count(1) 
from clients 
    join factures on (clients.id = factures.client_id) 
group by 1, 2
order by count(1) desc;

update clients set currency = 'EUR';

SELECT anon.stop_dynamic_masking();
alter table clients ALTER COLUMN first_name type varchar(200);
SELECT anon.start_dynamic_masking();
