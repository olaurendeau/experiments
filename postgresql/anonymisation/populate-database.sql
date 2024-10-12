CREATE TABLE clients (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    age SMALLINT CHECK (age >= 0 AND age <= 150),
    email VARCHAR(255) CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z]{2,}$'),
    phone VARCHAR(20),
    currency CHAR(3) CHECK (currency ~ '^[A-Z]{3}$')
);

INSERT INTO clients (first_name, last_name, age, email, phone, currency)
VALUES
    ('Marie', 'Dupont', 35, 'marie.dupont@email.com', '+33123456789', 'EUR'),
    ('Jean', 'Martin', 42, 'jean.martin@email.com', '+33234567890', 'EUR'),
    ('Sophie', 'Lefebvre', 28, 'sophie.lefebvre@email.com', '+33345678901', 'EUR'),
    ('Thomas', 'Bernard', 50, 'thomas.bernard@email.com', '+33456789012', 'USD'),
    ('Céline', 'Dubois', 39, 'celine.dubois@email.com', '+33567890123', 'EUR'),
    ('Pierre', 'Moreau', 45, 'pierre.moreau@email.com', '+33678901234', 'GBP'),
    ('Isabelle', 'Laurent', 33, 'isabelle.laurent@email.com', '+33789012345', 'EUR'),
    ('François', 'Rousseau', 55, 'francois.rousseau@email.com', '+33890123456', 'CHF'),
    ('Nathalie', 'Leroy', 31, 'nathalie.leroy@email.com', '+33901234567', 'EUR'),
    ('Philippe', 'Girard', 47, 'philippe.girard@email.com', '+33012345678', 'USD');

-- Création de la table factures
CREATE TABLE factures (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    client_id UUID REFERENCES clients(id),
    numero_facture VARCHAR(20) UNIQUE,
    date_facture DATE,
    montant_total DECIMAL(10, 2),
    statut VARCHAR(20) CHECK (statut IN ('Payée', 'En attente', 'En retard')),
    date_paiement DATE
);

-- Insertion de quelques enregistrements
INSERT INTO factures (client_id, numero_facture, date_facture, montant_total, statut, date_paiement)
VALUES
    ((SELECT id FROM clients ORDER BY RANDOM() LIMIT 1), 'FACT-2024-001', '2024-01-15', 1250.50, 'Payée', '2024-01-20'),
    ((SELECT id FROM clients ORDER BY RANDOM() LIMIT 1), 'FACT-2024-002', '2024-02-01', 750.75, 'En attente', NULL),
    ((SELECT id FROM clients ORDER BY RANDOM() LIMIT 1), 'FACT-2024-003', '2024-02-10', 2000.00, 'Payée', '2024-02-15'),
    ((SELECT id FROM clients ORDER BY RANDOM() LIMIT 1), 'FACT-2024-004', '2024-03-05', 500.25, 'En retard', NULL),
    ((SELECT id FROM clients ORDER BY RANDOM() LIMIT 1), 'FACT-2024-005', '2024-03-20', 1500.00, 'En attente', NULL);
