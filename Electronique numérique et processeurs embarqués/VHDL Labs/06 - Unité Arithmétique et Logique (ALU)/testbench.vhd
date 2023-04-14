-- Testbench ALU
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SIMU is
end SIMU;

architecture ARCHI of SIMU is

signal inA,inB,S: std_logic_vector(3 downto 0);
signal opcode: std_logic_vector(1 downto 0);
signal NZP: std_logic_vector(2 downto 0);

begin

my_ALU: entity work.ALU
        port map(inA,inB,opcode,S,NZP);


inA<="0100", "1110" after 120 ns, "1011" after 220 ns, "0010" after 380 ns; 
inB<="0010";

opcode<="11", "00" after 20 ns, "10" after 300 ns, "11" after 500 ns, "00" after 700 ns;


end archi;