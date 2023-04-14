----------------------------------------------
--		LU3EE100 - TD2 - Exercice 2			--
--											--
--	Recommandations de Codage 				--
--							 				--
--	Respecter les noms suivants:			--
--    Nom de l'entité: 	Registre			--
--											--
--    Nom des Entrées: 	Clk,Reset sur 1 bit	--
--						Com sur 2 bits		--
--						Entree sur 8 bits	--
--											--
--    Nom des sorties: 	Sortie sur 8 bits	--
----------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Registre is
port( clk,Reset : in std_logic;
      Com : in std_logic_vector(1 downto 0);
      Entree : in std_logic_vector( 7 downto 0);
      Sortie : out std_logic_vector( 7 downto 0 ));
end Registre;

architecture sequentiel_register of Registre is 

signal Sortie_temp : std_logic_vector( 7 downto 0 );
begin
Sortie <= Sortie_temp ;
process(clk,Reset)
begin

 if (Reset='0') then Sortie_temp <= (others => '0');
  elsif rising_edge (clk) then

case Com is
    when "00" => Sortie_temp <= Sortie_temp;------- mémorisation
    when "01" => Sortie_temp <= Entree; -----------chargement paralèlle
    when "10" => Sortie_temp <= (others => '0'); ---reset
    when "11" => Sortie_temp <= not(Sortie_temp); --inversion
end case;
end process;

end sequentiel_register;





      