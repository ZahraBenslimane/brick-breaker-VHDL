-- MAE Testbench
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SIMU is
end SIMU;

architecture TestbenchMode of SIMU is
signal Clk25, Reset : std_logic := '0';
signal Endframe     : std_logic := '0';
signal Pause_Rqt    : std_logic := '0';
signal Lost         : std_logic := '0';
signal No_Brick     : std_logic := '0';


signal Pause     : std_logic;
signal Game_Lost : std_logic;
signal Brick_Win : std_logic;

begin

My_Mode : entity work.Mode
port map (
           Clk25      => Clk25,
           Reset      => Reset,
           Endframe   => endframe,
           Pause_Rqt  => Pause_Rqt, 
           Lost       => Lost,
           No_Brick   => No_Brick,
           Pause      => Pause,
           Game_Lost  => Game_Lost,
           Brick_Win  => Brick_Win
         );  
           
   -- Valeurs d'entrées--

     --Période T= 1/25MHz = 40ns
  clk25 <= not clk25 after 5 ns;  
  Reset <= '1' after 20 ns;  --actif à l'état bas 
  
  Endframe <= '1' after 50ns;
           
  Pause_Rqt <= '0',
           '1' after 500ns, 
           '0' after 700ns,
           '1' after 1300ns,
           '0' after 1800ns,
           '1' after 2300ns, 
           '0' after 2800ns;
           
                             
 -- Simulation d'une partie perdue                   
  Lost <= '0',
           '1' after 30us, 
           '0' after 30.5us;
                          
           
  No_Brick <= '0';
  
  
  -- Simulation d'une partie gagnée 
--   Lost <= '0';
   
--  No_Brick <= '0',
--              '1' after 30us, 
--              '0' after 30.5us;                 
                  
                               
           

end TestbenchMode;