bank = LOAD 'bank.csv' USING PigStorage(';') AS (id:chararray, client_id:int, versement:float, retrait:float, annee:int);
debiteurs = FILTER bank BY versement<retrait;
idDebiteurs = FOREACH debiteurs GENERATE client_id;
idDebiteursUnique = DISTINCT idDebiteurs;
DUMP idDebiteursUnique;

--Question2:

bank = LOAD 'bank.csv' USING PigStorage(';') AS (id:chararray, client_id:int, versement:float, retrait:float, annee:int);
clients_banque = GROUP bank BY id;
clients_par_banque = DISTINCT clients_banque;
nbr_clients_banque = FOREACH clients_par_banque GENERATE group AS banque_id, COUNT(bank.client_id) AS nbr_clients;
DUMP nbr_clients_banque;

--Question3:

debiteursUniquet= DISTINCT debiteurs;
debiteurs_banque = GROUP debiteursUniquet BY id;
debiteurs_banque_dist = DISTINCT debiteurs_banque;
nombre_debiteurs = FOREACH debiteurs_banque_dist GENERATE group AS banque_id, COUNT(debiteursUniquet.client_id) AS nombre_debiteurs;
DUMP nombre_debiteurs;

--Question4:

distinct_clients = DISTINCT bank;
clients_par_banque = GROUP distinct_clients BY id;
clients_id_par_banque = FOREACH clients_par_banque GENERATE group AS banque_id, distinct_clients.client_id AS clients_id;
DUMP clients_id_par_banque;

--Question5:

clients = GROUP bank BY client_id;
clients_montant_total = FOREACH clients GENERATE group as client_id, SUM(bank.versement) AS total_verse, SUM(bank.retrait) AS total_retire;
DUMP clients_montant_total;



