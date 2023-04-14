----------------------------------------------------------------------------------
-- Company: Sorbonne Université
-- Engineer: Julien Denoulet
--
-- Affichage VGA 4 bits - Commande de Couleur par Interrupteurs
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top is
    Port ( Clk100 : in STD_LOGIC;                           -- Horloge 100 MHz
           Reset : in STD_LOGIC;                            -- Reset Asynchrone
           Red : in STD_LOGIC_VECTOR (3 downto 0);          -- Consigne Couleur Rouge (4 bits)
           Green : in STD_LOGIC_VECTOR (3 downto 0);        -- Consigne Couleur Verte (4 bits)
           Blue : in STD_LOGIC_VECTOR (3 downto 0);         -- Consigne Couleur Bleue (4 bits)
           VGA_Red : out STD_LOGIC_VECTOR (3 downto 0);     -- Composante Rouge de la Couleur VGA Affichée
           VGA_Green : out STD_LOGIC_VECTOR (3 downto 0);   -- Composante Verte de la Couleur VGA Affichée
           VGA_Blue : out STD_LOGIC_VECTOR (3 downto 0);    -- Composante Bleue de la Couleur VGA Affichée
           HSync : out STD_LOGIC;                           -- Synchro Horizontale VGA
           VSync : out STD_LOGIC);                          -- Synchro Verticale VGA
end Top;

architecture Behavioral of Top is

signal Clk25: std_logic;                            -- Horloge 25 MHz

signal Reset_N: std_logic;                          -- Reset Actif Bas

begin

    Reset_N <= not Reset; -- Reset Actif au Niveau Bas

    -- Diviseur Horloge 100 MHz --> 25 Mhz
    Diviseur:   entity work.ClkDiv
                port map(
                    clk100 => Clk100,   -- Horloge 100 Mhz
                    reset => Reset_N,   -- Reset Asynchrone
                    clk25 => Clk25      -- Horloge 25 MHz
                );


    -- Contrôleur VGA 4 Bits
    VGA:        entity work.VGA_4bits
                port map(
                    clk25 => Clk25,         -- Horloge
                    reset => Reset_N,       -- Reset Asynchrone
                    r => Red,               -- Commande de Couleur Rouge
                    g => Green,             -- Commande de Couleur Verte
                    b => Blue,              -- Commande de Couleur Bleue
                    red => VGA_Red,         -- Affichage Couleur Rouge vers Ecran VGA
                    green => VGA_Green,     -- Affichage Couleur Verte vers Ecran VGA
                    blue => VGA_Blue,       -- Affichage Couleur Bleue vers Ecran VGA
                    hsync => HSync,         -- Synchro Ligne
                    vsync => VSync,         -- Synchro Trame
                    visible => open,        -- Partie Visible de l'Image
                    endframe => open,       -- Dernier Pixel Visible d'une Trame
                    xpos => open,           -- Coordonnée X du Pixel Courant
                    ypos => open            -- Coordonnee Y du Pixel Courant
                );

end Behavioral;
