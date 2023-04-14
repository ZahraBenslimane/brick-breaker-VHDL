------------------------------------------
--		LU3EE100 - TD3 - Exercice 1		--
--										--
--			ADDITIONNEUR BCD			--
--										--
------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Adder_BCD is
	port(	A,B: in std_logic_vector(3 downto 0);
    		S: out std_logic_vector(4 downto 0);
        	error: out std_logic);
end Adder_BCD;

architecture archi of Adder_BCD is

signal Add1,Add2: std_logic_vector(4 downto 0);
signal Six : std_logic_vector(2 downto 0);
signal Sup : std_logic;

begin

	Six	<= "110";
    
    Add1 <= '0'&A + B;
    
    Add2 <= Add1 + Six;

	Sup <= '1' when Add1>9 else '0';

	S <= Add2 when Sup = '1' else Add1;

	error <= '1' when (A>9 or B>9) else '0';

end archi;



