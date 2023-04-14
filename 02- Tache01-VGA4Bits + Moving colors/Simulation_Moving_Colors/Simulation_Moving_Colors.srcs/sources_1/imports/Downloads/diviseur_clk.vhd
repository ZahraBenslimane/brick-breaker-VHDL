library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;


--déclaration de l'entité 
entity ClkDiv is
port ( Clk100, Reset : in std_logic;
            Clk25 : out std_logic  );
end ClkDiv;

--architecture comportementale            
architecture archi of ClkDiv is
--description d'un signal intermediaire  
signal compteur_Clk : std_logic_vector(1 downto 0);
begin
process(Clk100, Reset)

begin

if  Reset = '0' then 
                compteur_Clk <= "00";

elsif rising_edge(clk100) then 
          compteur_Clk <= compteur_Clk + 1 ;

end if;

end process;

clk25 <= compteur_Clk (1);

end archi;