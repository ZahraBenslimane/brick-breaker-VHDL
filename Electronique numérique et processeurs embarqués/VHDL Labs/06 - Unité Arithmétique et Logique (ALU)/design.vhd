----------------------------------------------
--		LU3EE100 - TD4 - Exercice 1			--
--											--
--		Unité Arithémtique et Logique		--
--							 				--
----------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU is port(
   		  -- Entrées de l'ALU
          inA, inB: in std_logic_vector(3 downto 0); 
          -- Choix de l'operation
          opcode: in std_logic_vector(1 downto 0);	 
          -- Résultat de l'operation
          S: out std_logic_vector(3 downto 0); 
          -- Indicateurs sur la nature du resultat
          NZP: out std_logic_vector(2 downto 0)); 
end ALU;

-- NZP(2): Resultat negatif
-- NZP(1): Resultat nul
-- NZP(0): Résultat Positif

architecture archi of ALU is
    
-- Signal intermediaire
signal result: std_logic_vector(3 downto 0);

begin

    
	-- Gestion des calculs de l'ALU
    process (opcode,inA,inB)
    begin
    
       case opcode is
       
          when "00" => result<=inA+inB;
          when "01" => result<=inA and inB;
          when "10" => result<=not inA;
          when "11" => result<=inA;
          when others => NULL;

		end case;
-- Gestion des Indicateurs
NZP(2) <= result(3);
NZP(1) <= not(result(3) or result(2) or result(1) or result(0));
NZP(0) <= not result(3) and (result(2) or result(1) or result(0));       


end process;
-- Affectation du Résultat en Sortie
S<=result; 
    

end archi;