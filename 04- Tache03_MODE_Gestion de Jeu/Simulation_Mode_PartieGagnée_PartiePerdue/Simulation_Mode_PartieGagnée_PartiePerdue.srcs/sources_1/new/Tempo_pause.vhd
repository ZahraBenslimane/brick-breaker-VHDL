---------------------------------------------------
-- SORBONNE UNIVERSITE                             
-- Students:  Zahra Benslimane & Hiba Khechai      
--                                                 
-- 1) Tempo Pause:                                 
--    ? Compteur permettant de gérer l'anti rebond 
--      du bouton poussoir de l'encodeur rotatif.  
--                                                 
--    ? Utilisé pour la gestion du mode Pause      
--      de la SU-EE100                             
--                                                 
---------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Tempo_Pause is
port (
       Clk25              : in std_logic;
       Reset              : in std_logic;  --Reset asynchrone, actif à l'état bas
       RAZ_Tempo_Pause    : in std_logic;
       Update_Tempo_Pause : in std_logic;
       
       Fin_Tempo_Pause : out std_logic
       
     );
end Tempo_Pause;     
               --Fonctionnement du sous-module Tempo_Pause--
--? Tempo Pause est un compteur 10 bits possédant les fonctionnalités suivantes   
--o RAZ synchrone (si RAZ_Tempo_Pause est activée)                                
--o Incrémentation (si Update_Tempo_Pause est activée)                            
--o Maintien de la valeur précédente (si aucune commande n'est activée)           
--                                                                                
--o La sortie du compteur est comparée de façon combinatoire à la valeur maximale 
-- (tous les bits à 1). Si tel est le cas, la sortie Fin_Tempo_Pause est activée.

architecture Behavioral of Tempo_Pause is

signal cpt : std_logic_vector(9 downto 0) ;
signal com : std_logic_vector(1 downto 0) ;

begin

com <= RAZ_Tempo_Pause & Update_Tempo_Pause ;

process(clk25 , reset)

begin
    if cpt ="1111111111" then 
        Fin_Tempo_Pause<='1' ;
    else 
        Fin_Tempo_Pause<='0';
        
    if reset='0' then
         cpt<=(others =>'0');
    elsif rising_edge(clk25) then 
    
       case com is
			when "00"	=> cpt <= cpt ; 
			when "01"  	=> cpt <= cpt+1 ;             
			when "10"  	=> cpt <= (others =>'0') ; 
			when "11"  	=> cpt <= (others =>'0') ;
			when others => cpt <= cpt ;
	   end case;

end if;
end if;
end process;


end Behavioral;