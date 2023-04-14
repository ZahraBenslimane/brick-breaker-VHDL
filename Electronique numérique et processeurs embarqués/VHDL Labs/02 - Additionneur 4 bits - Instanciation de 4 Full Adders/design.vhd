--------------------------------------
-- 	LU3EE100 - TD1 - Exercice 1		--
--	Additionneur 4 bits Structurel	--
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Adder_4bits_Struct is
	port (	A,B: in std_logic_vector(3 downto 0);
    		Cin: in std_logic;
    		S: out std_logic_vector(3 downto 0);
    		Cout: out std_logic);
end Adder_4bits_Struct;

architecture archi of Adder_4bits_Struct is

-- Signal Interne - Retenues entrantes/sortantes
signal CARRY: std_logic_vector(4 downto 0);

begin

CARRY(0) <= Cin;	-- Retenue Entrante
Cout <= CARRY(4);	-- Retenue Sortante

-- Instanciation des 4 Full Adders
Boucle: for i in 0 to 3 generate

	My_FA: 	entity work.FA
    		port map (	A => A(i), B => B(i), Cin => CARRY(i),
            			S => S(i), Cout => CARRY(i+1));

end generate;

end archi;


