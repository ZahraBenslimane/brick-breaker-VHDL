---------------------------------------------------
-- SORBONNE UNIVERSITE                             
-- Students:  Zahra Benslimane & Hiba Khechai      
--                                                 
-- 2) Timer Lost:                                  
--    ? Compteur permettant de générer la sortie   
--           Game_Lost.                            
--                                                 
---------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Timer_Lost is
port (
       Clk25              : in std_logic;
       Reset              : in std_logic;
       Load_Timer_Lost    : in std_logic;
       Update_Timer_Lost  : in std_logic;
       
       Game_Lost  : out std_logic;
       Timer_Lost : out std_logic_vector(5 downto 0) 
       
     );
end Timer_Lost;     
     
--? Timer Lost est un compteur 6 bits possédant les fonctionnalités suivantes   
--o Chargement parallèle à la valeur 63 (tous les bits à 1) (si Load_Timer_Lost 
--                                                                 est activée) 
--o Décrémentation (si Update_Timer_Lost est activée)                           
--o Maintien de la valeur précédente (si aucune commande n'est activée)         
--o La sortie du compteur est comparée de façon combinatoire à 0. Si la sortie  
--  est supérieure à 0, la sortie Game_Lost est activée                         


architecture compteur_6bits of Timer_Lost is
--Declaration des signaux intermédiaires --
signal s_cpt         : std_logic_vector (5 downto 0);
--signal s_Timer_Lost  : std_logic_vector (5 downto 0);
signal s_Game_Lost   : std_logic := '0';

begin


process (Clk25, Reset)

begin 
if Reset = '0' then 
                   s_cpt <="000000"; 
elsif rising_edge(Clk25) then

  if (Load_Timer_Lost='1') then s_cpt <= (others =>'1');
  elsif (Update_Timer_Lost = '1') then s_cpt <= s_cpt - 1 ; 
  else s_cpt <= s_cpt;
  end if;
  
  if ( s_cpt ="000000" ) then s_Game_Lost <='0';
  else s_Game_Lost <= '1';
  end if ;
  
end if;  
end process;

Timer_Lost <= s_cpt;
Game_Lost <=  s_Game_Lost;

end compteur_6bits;


