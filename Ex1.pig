
/* chargement du data */
vol = load '/home/cloudera/Desktop/TP_MapRed/vol.csv' using PigStorage(';') as (year:chararray,month:chararray,jour:chararray,numvol:int,Ardepart:chararray,Ararrivee:chararray,distance:int);

 /*Question 1 */
volgroup = group vol by Ardepart;

volcountAr = foreach volgroup generate group as areaoport, COUNT(vol) as nombreVol;

/*Question 2 */
volFiltredDepart = filtre vol by Ardepart == '$airpar';

/*exemple de 'IND'*/ : volFiltredDepart = filter vol by Ardepart Matches 'IND';

groupFilt = group volFiltredDepart all;
volcount = foreach groupFilt generate count(volFiltredDepart) as nb_vol;

/*Question 3 */
groupvol = group vol all ;
maxdistance = foreach groupvol generate MAX(vol.distance) as maxdistance;
