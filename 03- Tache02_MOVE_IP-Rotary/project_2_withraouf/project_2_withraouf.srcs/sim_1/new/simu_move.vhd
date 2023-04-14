--Testbench Ip_Rotary
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity simu is
end simu;


architecture Testbench of simu is 

signal Rot_Left,Rot_Right : std_logic;
signal Qa, Qb: std_logic :='0';
signal clk25, Reset : std_logic:='0';

begin
 
--Instanciation du module à simuler  
  My_move : entity work.move
  port map( 
          clk25 => clk25,
          Reset => Reset,
          QA => Qa,
          QB => Qb,
          
          Rot_Right => Rot_Right,
          Rot_Left => Rot_Left);
          
-- Valeurs d'entrées

  clk25 <= not clk25 after 20 ns;  --Période T= 1/25MHz = 40ns
  Reset <= '1' after 20 ns;        --actif à l'état bas
  -- quand QA change AVANT QB
  qa <= '0',
           '1' after 120ns, 
           '0' after 320ns,
           '1' after 430ns,
           '0' after 600ns,
           '1' after 775ns,
           '0' after 985ns,
           '1' after 1230ns;
           
           
  qb <= '0',
           '1' after 160ns,
           '0' after 370ns,
           '1' after 550ns,
           '0' after 660ns,
           '1' after 730ns,
           '0' after 860ns,
           '1' after 1060ns;
          
                     
  
end Testbench;
