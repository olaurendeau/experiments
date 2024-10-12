select * from clients limit 1;

select first_name_hash, last_name_hash, count(1) 
from clients_anonymized 
    join factures on (clients_anonymized.id = factures.client_id) 
group by 1, 2
order by count(1) desc;

update clients set currency = 'EUR';

-- it's not possible to change the column type without removing the view first
alter table clients ALTER COLUMN first_name type varchar(200);