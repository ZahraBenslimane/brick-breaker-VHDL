---------------------------------------------------
--  SORBONNE UNIVERSITE                            
-- Students: Hiba Khechai & Zahra Benslimane       
--                                                 
--	Move : est une Machine à Etats qui génère les  
--        commandes de déplacement Rot_Left        
--             et Rot_Right                        
--                                                 
---------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity move is
port( Clk25 : in std_logic; -- Horloge 25Mhz
      Reset : in std_logic; --Reset asynchrone, actif à l'état bas
      QA    : in std_logic; -- Comportement du Switch A (Filtre)
      QB    : in std_logic; -- Comportement du Switch B (Filtre)
      
      Rot_Left : out std_logic;-- Commande de rotation à gauche
      Rot_Right : out std_logic -- Commande de rotation à droite
);
end move;

architecture archi of move is

--décaration des états de la machine 
type etat is ( S0, S1, S2, S3, S4, S5);
-- déclaration des signaux intermériaires
signal FUT,PRES : etat;

begin
----------------------------------------------
-- 		PROCESS DU REGISTRE D'ETAT 		    --
----------------------------------------------

process(Reset, Clk25)
begin

if (Reset = '0') then 

         PRES <= S0;  --Retour à l'état initial     

elsif ( rising_edge (Clk25) ) then

 	     PRES <= FUT;
end if;
end process;

----------------------------------------------
-- 		PROCESS DE CALCUL DE L'ETAT FUTUR	--
----------------------------------------------

process(PRES, QA, QB) -- etat present + les entrées
begin 

case (PRES) is

when S0 =>  if QA='1'and QB='0' then FUT <= S1 ;
                  elsif QA='1'and QB='1'then FUT <= S4 ; end if;
                   
when S1 => FUT <= S2;

when S2 =>  if QA='0'and QB='1' then FUT <= S3 ;
                  elsif QA='0'and QB='0' then FUT <= S5 ; end if;
                  
when S3 => FUT <= S0; 
when S4 => FUT <= S2;
when S5 => FUT <= S0;

end case;
end process;

----------------------------------------------
-- 		PROCESS DE CALCUL DES SORTIES 		--
----------------------------------------------
process (PRES)
begin

case (PRES) is

when S0 => Rot_Left <= '0'   ; Rot_Right <= '0' ;
when S1 => Rot_Left <= '1'   ; Rot_Right <= '0' ;
when S2 => Rot_Left <= '0'   ; Rot_Right <= '0' ;
when S3 => Rot_Left <= '1'   ; Rot_Right <= '0' ;
when S4 => Rot_Left <= '0'   ; Rot_Right <= '1' ;
when S5 => Rot_Left <= '0'   ; Rot_Right <= '1' ;

end case;
end process;


end archi;