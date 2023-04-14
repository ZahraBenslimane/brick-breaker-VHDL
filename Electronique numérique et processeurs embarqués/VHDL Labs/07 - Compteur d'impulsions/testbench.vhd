-- Testbench Compteur Impulsions
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SIMU is
end SIMU;

architecture ARCHI of SIMU is

signal clk,reset,top: std_logic:='0';
signal count: std_logic_vector(7 downto 0);

begin

my_CPT: entity work.CPT_IMPULSE_3
        port map(clk,reset,top,count);

clk<=not clk after 5 ns;

top <= '1' after 50 ns, '0' after 80 ns,
      '1' after 130 ns,'0' after 180 ns,
      '1' after 240 ns,'0' after 340 ns,
      '1' after 370 ns,'0' after 400 ns,
      '1' after 440 ns,'0' after 530 ns;

reset<=	'1' after 30 ns, '0' after 220 ns, 
		'1' after 350 ns;

end archi;