--------------------------------------
-- 	LU3EE100 - TD1 - Exercice 1		--
--		Additionneur Complet 1 Bit	--
--									--
--	Recommandations de Codage 		--
--							 		--
--	Respecter les noms suivants:	--
--    Nom de l'entité: FA			--
--    Nom des Entrées: A,B,Cin 		--
--    Nom des sorties: S,Cout  		--
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FA is
port( a,b,cin : in std_logic;
     s,cout : out std_logic);
end FA;

architecture dataflow of FA is 
begin 
  s <= a XOR b XOR cin;
  cout <= (a and b) or (cin and (a xor b));
end dataflow;