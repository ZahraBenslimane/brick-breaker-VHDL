-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SIMU is
end SIMU;

architecture ARCHI of SIMU is

signal A,B: std_logic_vector(3 downto 0):="0000";
signal Cin: std_logic:='0';
signal S: std_logic_vector(3 downto 0);
signal Cout: std_logic;

begin

-- Instanciation du Module à Simuler
My_Adder: entity work.Adder_4bits_Struct
port map(
			A 		=> A,
			B 		=> B,
			Cin		=> Cin,
            S		=> S,
            Cout	=> Cout
        );

--Valeur des Entrées
A <= "0110" after 100 ns, "1100" after 300 ns;
B <= "0101" after 200 ns, "1001" after 400 ns;
Cin <= not Cin after 50 ns;

end ARCHI;
