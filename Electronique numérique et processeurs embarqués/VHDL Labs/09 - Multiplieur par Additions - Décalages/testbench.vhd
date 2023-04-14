library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SIMU is
end SIMU;

architecture ARCHI OF SIMU is

signal CLK,RESET,START:std_logic:='0';
signal A,B: std_logic_vector(7 downto 0);
signal S: std_logic_vector(15 downto 0);
signal FIN: std_logic; 

begin
  
My_MULT: entity work.MULT
  port map(CLK,RESET,START,A,B,S,FIN);

A <= "00001001";
B <= "00000110";
  
CLK <= NOT Clk after 5 ns;
RESET <= '1' after 2 ns;
START <= '1' after 43 ns, '0' after 53 ns;

end ARCHI;


