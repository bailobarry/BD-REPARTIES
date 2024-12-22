--- Commande pour recréer le fragment maître sur ETUSEC: 
COPY FROM BRM2996A/"B@rry1999"@brehat.univ-tlse3.fr:1521:etusec - 
TO BRM2996A/"B@rry1999"@brehat.univ-tlse3.fr:1521:etusec -  
REPLACE Athlete_2_maitre -  
USING SELECT * -  
FROM Athlete_2; 

-- Commandes pour recréer les fragments clichés depuis ETUSEC sur ETUPRE et ETUTER:
-- Sur ETUTER
COPY FROM BRM2996A/"B@rry1999"@brehat.univ-tlse3.fr:1521:etusec -  
TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etuter -  
REPLACE Athlete_2_cliche -  
USING SELECT * -  
FROM Athlete_2;

-- Sur ETUPRE
COPY FROM BRM2996A/"B@rry1999"@brehat.univ-tlse3.fr:1521:etusec -  
TO BRM2996A/"B@rry1999"@telline.univ-tlse3.fr:1521:etupre -  
REPLACE Athlete_2_cliche -  
USING SELECT * -  
FROM Athlete_2;



