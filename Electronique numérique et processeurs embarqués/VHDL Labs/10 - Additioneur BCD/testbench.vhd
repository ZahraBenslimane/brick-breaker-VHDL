-- Code du Testbench de l'Additionneur BCD
-- Inspirez-vous des exemples vus en cours

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity simu is 
end simu;
--Déclaration des signaux intermédiaires.
architecture TestBench of simu is

signal A,B: std_logic_vector(3 downto 0):="0000";
signal S:  std_logic_vector(4 downto 0);
signal error:  std_logic;


begin 
-- Instanciation du Module à Simuler
My_Adder_BCD : entity work.Adder_BCD
port map(
   
          A => A,
          B => B,
          S => S,
          error => error
         );
--Valeur des Entrées         

process -- process statement is written without the sensitivity list.
variable mot_8bit : std_logic_vector (7 downto 0):=x"00";

begin
   A <= mot_8bit(3 downto 0);
   B <= mot_8bit(7 downto 4);
  
 mot_8bit := mot_8bit + 1; --mot 8bt est une variable
 
 if( mot_8bit (3 downto 0)=X"A") then
    mot_8bit (3 downto 0):=x"0";
    mot_8bit (7 downto 4) := mot_8bit (7 downto 4) +1;
    end if;
    
 if( mot_8bit (7 downto 4) =X"A") then
    mot_8bit (7 downto 0):=x"0";
    mot_8bit (4 downto 0) := x"0";   
    end if;

 wait for 20 ns;
  
end process;  

end TestBench;