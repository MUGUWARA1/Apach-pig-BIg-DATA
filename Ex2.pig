

text = load '/home/cloudera/pig_lab/input' as (line:chararray);

-- Filtrer les lignes contenant le mot recherché
filtered_text = FILTER text BY line MATCHES '.*\\b$mot_recherche\\b.*';

-- Compter le nombre d'occurrences
occurrences = FOREACH (GROUP filtered_text ALL) GENERATE COUNT(filtered_text);


Exemple de mot 'Quand' :
filtered_text = FILTER text BY line MATCHES '.*\\bQuand\\b.*';

