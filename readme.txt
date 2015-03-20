HOW TO POPULATE PLAYOFFS:

rake lapencauy:populate_playoffs[Brasil,Holanda,Japon,Inglaterra,Francia,Alemania,Argentina,Belgica,Croacia,España,Colombia,Uruguay,Suiza,Bosnia,Portugal,'Corea del S']

USING REAL QUALIFIED TEAM NAMES (EXACTLY AS THEY ARE ON THE DB).
FIRST 8 TEAMS ARE QUALIFIED AS FIRST OF GROUP, IN ALPHABETICAL ORDER.
SECOND 8 TEAMS ARE QUALIFIED AS SECOND OF GROUP, IN ALPHABETICAL ORDER.

TODO:
    - Add to lapencauy:populate_playoffs a mechanism to assign points to users following these rules:
        * El puntaje que se atribuirá por acertar los clasificados a la fase de octavos de final es el siguiente:
            + 20 PUNTOS: Por acertar cada equipo que pasa a Octavos de Final.  
            + 10 PUNTOS: Por acertar la posición en la que se clasifica (Primero o Segundo)

        *Ejemplo: Clasifica Equipo A y Equipo C, primero y segundo respectivamente:
            + Jugador X Puso: 1ero EQUIPO A Y 2do EQUIPO B: (Puntos que gana 20+10=30) 
            + Jugador Y Puso: 1ero EQUIPO C Y 2do EQUIPO A: (Puntos que gana 20+20=40) 
            + Jugador Z Puso: 1ero EQUIPO A Y 2do EQUIPO C: (Puntos que gana 20+20+10+10=60)