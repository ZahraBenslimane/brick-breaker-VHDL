------------------------------------------------------
--		LU3EE100 - TD2 - Exercice 1					--
--													--
--	Recommandations de Codage 						--
--							 						--
--	Respecter les noms suivants:					--
--    Nom de l'entité: 	LFSR						--
--													--
--    Nom des Entrées: 	Clk,Reset sur 1 bit			--
--						Reset actif à l'état bas	--
--													--
--    Nom des sorties: 	Q sur 4 bits				--
------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity LFSR is
port ( clk, reset : in std_logic;
        Q : out std_logic_vector ( 3 downto 0 ));    
end LFSR;

architecture sequentiel_LFSR of LFSR is

signal current_state : std_logic_vector ( 3 downto 0);
signal next_state : std_logic_vector ( 3 downto 0);
signal feedback : std_logic;

begin

  feedback <= current_state(0) XOR current_state(1);
  next_state <= feedback & current_state(3 downto 1);

  process ( clk,reset )
  begin
  
  if reset = '0' then current_state <= "0100";
  elsif (clk'event and clk = '1') then 
   current_state <= next_state; 
  end if;
  
  end process;
  
  Q <= current_state;
  
  
end sequentiel_LFSR;  



