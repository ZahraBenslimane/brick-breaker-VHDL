library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Compteurs  is
port ( Clk, Reset : in std_logic;  --Cadencée par l'horloge 20Hz [10MHz pour la simulation]

            B1B0  : in std_logic_vector(1 downto 0); --Commande MUX du cpt blue sur 2bis 
            R1R0  : in std_logic_vector(1 downto 0); --Commande MUX du cpt red sur 2bits
            G1G0  : in std_logic_vector(1 downto 0); --Commande MUX du cpt green sur 2bits
            
            --Sorties des compteurs couleurs primaires
           RED_Out   : out std_logic_vector(3 downto 0 ); 
           GREEN_Out : out std_logic_vector(3 downto 0 );
           BLUE_Out  : out std_logic_vector(3 downto 0 ) );
            
end Compteurs;

architecture cpt of Compteurs is

--Déclaration des signaux intermédiaires
signal s_cpt_red : std_logic_vector(4 downto 0);
signal s_cpt_green : std_logic_vector(4 downto 0);
signal s_cpt_blue : std_logic_vector(4 downto 0);

begin
--Affectation des signaux intermédiaires aux sorties des compteurs

RED_Out   <= s_cpt_red(4 downto 1);
GREEN_Out <= s_cpt_green(4 downto 1);
BLUE_Out  <= s_cpt_blue(4 downto 1);


--red
process(Clk, Reset,R1R0)
begin

if Reset = '0' then 
                   s_cpt_red <="11111";
elsif rising_edge(Clk) then 
          
       case R1R0 is
                
          when "01" => s_cpt_red <= s_cpt_red +1; --Incrémentation
          when "10" => s_cpt_red <= s_cpt_red -1; --Décrémentation
          when "11" => s_cpt_red <= s_cpt_red;    --Mémorisation
          when others => NULL;

		end case;
        
end if;        
end process;

--green
process(Clk, Reset,G1G0)
begin 

if Reset = '0' then 
                   s_cpt_green <="00000";
elsif rising_edge(Clk) then 

       
       case G1G0 is
                 
          when "01" => s_cpt_green <= s_cpt_green +1;
          when "10" => s_cpt_green <= s_cpt_green -1;
          when "11" => s_cpt_green <= s_cpt_green;
          when others => NULL;

		end case;
end if;        
end process;

--blue
process(Clk, Reset,B1B0)

begin 

if Reset = '0' then 
                   s_cpt_blue <="00000";
elsif rising_edge(Clk) then 
    
       case B1B0 is      
 
          when "01" => s_cpt_blue <= s_cpt_blue +1;
          when "10" => s_cpt_blue <= s_cpt_blue -1;
          when "11" => s_cpt_blue <= s_cpt_blue;
          when others => NULL;

		end case;
end if;        
end process;


end cpt;