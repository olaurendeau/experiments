CREATE OR REPLACE VIEW clients_anonymized AS
SELECT 
    id,
    MD5(first_name) AS first_name_hash,
    MD5(last_name) AS last_name_hash,
    age,
    MD5(email) AS email_hash,
    MD5(phone) AS phone_hash,
    currency
FROM clients;

-- Allow only select to metabase user
GRANT SELECT ON factures TO metabase_ro_user;
GRANT SELECT ON clients_anonymized TO metabase_ro_user;
