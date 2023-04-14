-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SIMU is
end SIMU;

architecture ARCHI of SIMU is

signal Clk,Reset: std_logic:='0';
signal Com: std_logic_vector(1 downto 0):="00";
signal Entree: std_logic_vector(7 downto 0):="00000000";
signal Sortie: std_logic_vector(7 downto 0);

begin

-- Instanciation du Module à Simuler
My_Registre: entity work.Registre
port map(
			Clk 	=> Clk,
			Reset 	=> Reset,
			Com		=> Com,
            Entree	=> Entree,
            Sortie	=> Sortie
        );

--Valeur des Entrées
Clk <= not Clk after 20 ns;
Reset <= '1' after 5 ns;
Com <= 	"01" after 210 ns, 
		"11" after 510 ns,
        "10" after 710 ns,
		"01" after 810 ns,
        "00" after 910 ns;
Entree <= 	"01001111" after 30 ns,
			"10110010" after 90 ns,
            "11111111" after 530 ns,
            "00111100" after 840 ns;

end ARCHI;
