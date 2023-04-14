-- TP2 3EE100 : DIVISEUR D'HORLOGE              --
--                                                
-- L'entité Clkdiv_10MHz                          
--                                                
---     Entrées :  Clk100 : Horloge 100 MHz       
--                         fournie par la carte   
--                 Reset : Reset asynchrone       
--                     (Actif à l'état bas)       
--                                                
--       Sortie :   Clk_10MHz : Horloge de sortie 
--                          à 10 MHz              

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
--déclaration de l'entité 

entity Clkdiv_10MHz  is
port ( Clk100, Reset : in std_logic;
            Clk_10MHz : out std_logic  );
end Clkdiv_10MHz;

--architecture          
architecture archi of Clkdiv_10MHz is

--description d'un signal intermediaire et d'un signal constant

--Compteur des fronds d'horloge clk100
        signal cpt_clk : std_logic_vector( 3 downto 0):= (others =>'0');
        
--Signal intermédiaire : permet de recopier le sortie de entrée
        signal s_Clk_10MHz : std_logic; 
        
--valeur à laquel clk_20Hz bascule d'un état à l'autre
-- pour avoir le clk à 20hz on met X"26259f"
        constant cpt_limit : std_logic_vector(3 downto 0):= X"4"; 

begin

Clk_10MHz <= s_Clk_10MHz;

process(Clk100, Reset)

begin

if (Reset = '0') then 
                cpt_clk <= X"0";
                s_Clk_10MHz <= '0';

elsif rising_edge(clk100) then 
                 
                 if (cpt_clk = cpt_limit) then
                             s_Clk_10MHz <= not (s_Clk_10MHz);
                             cpt_clk <= X"0";
                 
                 else            
                       cpt_clk <= cpt_clk + 1 ;
                 end if;      

end if;

end process;
end archi;