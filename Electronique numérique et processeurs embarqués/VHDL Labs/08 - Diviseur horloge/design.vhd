-- TP2 3EE100 : DIVISEUR D'HORLOGE              --
--                                                
-- L’entité Clkdiv_10MHz                          
--                                                
---     Entrées :  Clk100 : Horloge 100 MHz       
--                         fournie par la carte   
--                 Reset : Reset asynchrone       
--                     (Actif à l’état bas)       
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

--architecture comportementale            
architecture archi of Clkdiv_10MHz is

--description d'un signal intermediaire et d'un signal constant

--Compteur des frond d'horgole clk100
signal cpt_clk : std_logic_vector( 3 downto 0):= (others =>'0');
--valeur à laquel clk_20Hz bascule d'un état à l'autre
constant cpt_limit : std_logic_vector(3 downto 0):= X"4"; 

begin
process(Clk100, Reset)

begin

if (Reset = '0') then 
                cpt_clk <= X"0";
                Clk_10MHz <= '0';

elsif rising_edge(clk100) then 
                 
                 if (cpt_clk = cpt_limit) then
                             Clk_10MHz <= not (Clk_10MHz);
                             cpt_clk <= X"0";
                 
                 else            
                       cpt_clk <= cpt_clk + 1 ;
                 end if;      

end if;

end process;


end archi;
