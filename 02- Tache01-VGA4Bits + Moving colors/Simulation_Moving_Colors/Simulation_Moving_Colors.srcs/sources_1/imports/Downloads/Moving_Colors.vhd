library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity Moving_Colors is
port ( Clk100 : in std_logic;
        Reset : in std_logic;
        RED_Out : out std_logic_vector(3 downto 0);
        GREEN_Out : out std_logic_vector(3 downto 0);
        BLUE_Out : out std_logic_vector(3 downto 0) );

end Moving_Colors;


architecture archi of Moving_Colors is

--signaux intermediaires
signal s_Clk_10MHz : std_logic;
--Sorties MAE + entrees compteurs
signal s_B1B0 : std_logic_vector(1 downto 0);
signal s_R1R0 : std_logic_vector(1 downto 0);
signal s_G1G0 : std_logic_vector(1 downto 0);
--Sorties compteurs + entres MAE
signal s_RED_Out  : std_logic_vector(3 downto 0 ); 
signal s_GREEN_Out: std_logic_vector(3 downto 0 );
signal s_BLUE_Out : std_logic_vector(3 downto 0 );

--Instanciation des différents modules :
begin

--Diviseur d'horloge 
My_clk_div : entity work.Clkdiv_10MHz
port map ( Clk100 => Clk100,
         Reset => Reset,
        Clk_10MHz => s_Clk_10MHz );

--Machine à états
My_MAE  : entity work.MAE
port map(   Clk       => Clk100,
            Reset     => Reset,
            RED_Out   =>  s_RED_Out,
            GREEN_Out => s_GREEN_Out,
            BLUE_Out  => s_BLUE_Out,
            
            B1B0  => s_B1B0,
            R1R0  => s_R1R0,
            G1G0  => s_G1G0 );

--Compteurs 
My_Compteurs : entity work.Compteurs
port map(   Clk   => s_Clk_10MHz , 
            Reset => Reset,
            B1B0  => s_B1B0,
            R1R0  => s_R1R0,
            G1G0  => s_G1G0,
            
            RED_Out   => s_RED_Out,
            GREEN_Out => s_GREEN_Out,
            BLUE_Out  => s_BLUE_Out );
            
            
--Sorties de la machine à etats
 RED_Out   <= s_RED_Out;
 GREEN_Out <= s_GREEN_Out;
 BLUE_Out  <= s_BLUE_Out ;

end archi;
