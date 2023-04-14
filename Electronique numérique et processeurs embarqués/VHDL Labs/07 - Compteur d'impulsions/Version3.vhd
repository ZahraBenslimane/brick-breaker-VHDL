----------------------------------------------
--		LU3EE100 - TD4 - Exercice 2			--
--											--
--	 Compteur d'Impulsions (Version 3)		--
--							 				--
----------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CPT_IMPULSE_3 is
	port(  
		-- Horloge et Reset du Compteur
        clk,reset:   in std_logic;
		-- Signal d'Entrée
        top:   in std_logic;
        -- Nombre d'impulsions de top
		count: out std_logic_vector(7 downto 0)); 
end CPT_IMPULSE_3;

architecture archi of CPT_IMPULSE_3 is
    
-- Compteur d'impulsions
signal cpt: std_logic_vector(7 downto 0);
-- Signal interne
signal test: std_logic_vector(1 downto 0);
-- Valeur de top au cycle precedent
signal top_last: std_logic;
-- Commande d'incrementation du compteur
signal increm: std_logic;

begin
    
-- Test(1) = Valeur actuelle de l'entree
-- Test(0) = Valeur de l'entree au cycle precedent
test<=top&top_last;

-- Demande d'incrementation si transition montante de TOP
increm <= '1' when test="10" else '0';
    
-- Process pour sauvegarde de l'etat de TOP
process(clk,reset)
begin
    if reset='0' then top_last<='0'; 
	elsif rising_edge(clk) then

		top_last<=top; -- Bascule de memorisation
	
    end if;
end process;
    
-- Gestion du compteur d'impulsions
process(clk,reset)
begin        	
    -- Initialisation du Compteur
		if reset='0' then cpt<=(others =>'0');     
	    elsif rising_edge(clk) then
        
        -- Incrementation du compteur si commande active
		if increm='1' then cpt<=cpt+1; 
		end if;

	-- *** QUESTION 5: 
    -- METTRE L'INSTRUCTION SUR LA LIGNE CI-DESSOUS
    
-- Envoi de la valeur du compteur en sortie
count<=cpt;
	end if;
end process;
    
 
  
end archi;