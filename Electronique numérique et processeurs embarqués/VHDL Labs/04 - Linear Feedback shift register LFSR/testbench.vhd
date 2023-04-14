-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SIMU is
end SIMU;

architecture ARCHI of SIMU is

signal Clk,Reset: std_logic:='0';
signal Q: std_logic_vector(3 downto 0);

begin

-- Instanciation du Module à Simuler
My_Adder: entity work.LFSR
port map(
			Clk		=> Clk,
            Reset	=> Reset,
            Q		=> Q
        );

--Valeur des Entrées
Clk <= not Clk after 50 ns;
Reset <= '1' after 10 ns;

end ARCHI;
