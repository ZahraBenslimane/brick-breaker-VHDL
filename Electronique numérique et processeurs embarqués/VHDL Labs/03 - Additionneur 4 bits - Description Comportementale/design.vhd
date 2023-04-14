------------------------------------------
--		LU3EE100 - TD1 - Exercice 3		--
--										--
--	Recommandations de Codage 			--
--							 			--
--	Respecter les noms suivants:		--
--    Nom de l'entité: 	Adder_4bits		--
--										--
--    Nom des Entrées: 	A,B sur 4 bits	--
--						Cin sur 1 bit	--
--										--
--    Nom des sorties: 	S sur 4 bits	--
--						Cout sur 1 bit	--
------------------------------------------

--1)--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
--2)--------------------------------------
entity Adder_4bits	 is
port(A,B : in std_logic_vector(3 downto 0);
     Cin : in std_logic;
     S : out std_logic_vector( 3 downto 0);
     Cout : out std_logic);

end Adder_4bits	;

--3) Architecture : behavior
architecture behavior of Adder_4bits is
signal tampon : std_logic_vector(4 downto 0);

begin
tampon <= ("0" & A)+ ("0" & B) + ("0" & "000" & Cin) ;
-- tampon <= ("0" & A) + B + Cin

S <= tampon (3 downto 0);
Cout <= tampon(4);
end behavior;