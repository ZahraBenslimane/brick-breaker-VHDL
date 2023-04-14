-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SIMU is
end SIMU;

architecture ARCHI of SIMU is

signal A,B,Cin: std_logic:='0';
signal S,Cout: std_logic;

begin

-- Instanciation du Module à Simuler
My_FA: entity work.FA
port map(
			A 		=> A,
			B 		=> B,
			Cin		=> Cin,
            S		=> S,
            Cout	=> Cout
        );

--Valeur des Entrées
A <= not A after 100 ns;
B <= not B after 200 ns;
Cin <= not Cin after 400 ns;

end ARCHI;
