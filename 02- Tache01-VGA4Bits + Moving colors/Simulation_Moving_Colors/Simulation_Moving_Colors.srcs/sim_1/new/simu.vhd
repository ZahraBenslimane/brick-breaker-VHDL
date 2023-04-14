-- Code your testbench here
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity simu is
end simu;

architecture Testbench of simu is 

signal s_Clk100 : std_logic := '0';
signal s_Reset  : std_logic := '0';
signal s_RED_Out : std_logic_vector(3 downto 0) ;
signal s_GREEN_Out : std_logic_vector(3 downto 0) ;
signal s_BLUE_Out : std_logic_vector(3 downto 0);

begin

My_moving_Colors: entity work.Moving_Colors
port map (
           Clk100 => s_Clk100,
           Reset => s_Reset,
           RED_Out => s_RED_Out,
           GREEN_Out => s_GREEN_Out,
           BLUE_Out => s_BLUE_Out

);


s_Clk100 <= not(s_Clk100) after 10ns;
s_Reset <= '1' after 10ns;

end Testbench;

