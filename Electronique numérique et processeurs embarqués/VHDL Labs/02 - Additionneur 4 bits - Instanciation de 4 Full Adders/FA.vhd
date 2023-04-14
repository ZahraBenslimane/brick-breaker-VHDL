-- Additionneur 1 bit
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity FA is
	port (	A,B,Cin: in std_logic;
    		S,Cout: out std_logic);
end FA;

architecture archi of FA is
begin

    S <= A xor B xor Cin;
    Cout <= ((A xor B) and Cin) or (A and B);

end archi;



