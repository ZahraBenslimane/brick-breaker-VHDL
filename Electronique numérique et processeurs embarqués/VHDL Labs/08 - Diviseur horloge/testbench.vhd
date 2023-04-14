--Zahra                ---
-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity simu is
end simu;

architecture TestBench of simu is
--déclaration des signaux intermédiaires
signal s_Clk100 : std_logic := '0';
signal s_Reset  : std_logic := '0';
signal s_Clk_10MHz  : std_logic;

begin

My_Clkdiv_10MHz : entity work.Clkdiv_10MHz
port map ( Clk100 => s_Clk100,
           Reset => s_Reset,
           Clk_10MHz => s_Clk_10MHz );
           

s_Clk100 <= not(s_Clk100) after 10ns;
s_Reset <= '1' after 10ns;



end TestBench;