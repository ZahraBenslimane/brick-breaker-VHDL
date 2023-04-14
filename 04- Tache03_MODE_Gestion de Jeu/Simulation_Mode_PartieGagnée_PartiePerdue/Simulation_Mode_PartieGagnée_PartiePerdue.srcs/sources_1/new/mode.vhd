---------------------------------------------------
-- SORBONNE UNIVERSITE                             
-- Students:  Zahra Benslimane & Hiba Khechai      
--                                                 
--   sous-module MODE instancié dans GAME            
--	- Gestion de l'état de la partie               
--         (En cours, gagnée, perdue…)             
--  - Gestion du mode Pause.                       
--                                                 
---------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Mode is 
port (                            -- ENTREES DE MODE
       Clk25  : in  std_logic;       --Horloge 25 MHz
       Reset  :in std_logic;         --Reset asynchrone, actif à l'état bas
       Endframe  :in std_logic;      --Signal de fin de trame de l'image
       Pause_Rqt :in std_logic;      --Demande de mise en pause du jeu ou de sortie de pause
       Lost  : in std_logic;         --Indique que le pixel se trouve sur un des bords de l'écran
       No_Brick : in std_logic;      --Indique que toutes les briques ont été détruites
                                             --(jeu Casse Briques)
       
                                  -- SORTIES DE MODE
       Pause     : out std_logic;    --Indique si le jeu est en mode pause
       Game_Lost : out std_logic;    --Signal indiquant que la partie est perdue
       Brick_Win : out std_logic     --indique qu'une partie de Casse Briques est gagnée
       
       );
end Mode;

architecture archi of Mode is
-- Déclaration des signaux internes --
signal s_RAZ_Tempo_Pause   : std_logic;  -- MAE -> Tempo_Pause 
signal s_Update_Tempo_Pause: std_logic;  -- MAE -> Tempo_Pause 
signal s_Fin_Tempo_Pause   : std_logic;  --Tempo_Pause -> MAE  

signal s_Load_Timer_Lost   : std_logic;  -- MAE -> Timer Lost  
signal s_Update_Timer_Lost : std_logic;  -- MAE -> Timer Lost  
signal s_Timer_Lost : std_logic_vector( 5 downto 0 );  -- Timer Lost  ->  MAE 


begin
       -- Instanciation des sous modules de Mode -- 
       
My_MAE : entity work.MAE
port map ( --entrées
           Clk25  => Clk25,      
           Reset  => Reset,
       
           Endframe  => Endframe,  
           Pause_Rqt => Pause_Rqt,     
           Lost      => Lost,        
           No_Brick  => No_Brick,
       
           Fin_Tempo_Pause => s_Fin_Tempo_Pause,
           Timer_Lost      => s_Timer_Lost, -- signal 6bits
           
           --sorties vers d'autres sous-blocs
           RAZ_Tempo_Pause    =>  s_RAZ_Tempo_Pause,
           Update_Tempo_Pause =>  s_Update_Tempo_Pause,
       
           Load_Timer_Lost   =>  s_Load_Timer_Lost,
           Update_Timer_Lost =>  s_Update_Timer_Lost,
           
           --sorties du module Mode
           Pause     =>  Pause,    
           Brick_Win => Brick_Win    
       
     );       
            
       
My_Tempo_Pause : entity work.Tempo_Pause
port map (
       Clk25              => Clk25, 
       Reset              => Reset,
       RAZ_Tempo_Pause    => s_RAZ_Tempo_Pause,
       Update_Tempo_Pause => s_Update_Tempo_Pause,
       
       Fin_Tempo_Pause    =>   s_Fin_Tempo_Pause
     ); 


My_Timer_Lost : entity work.Timer_Lost
port map (
       Clk25              => Clk25, 
       Reset              => Reset,
       Load_Timer_Lost    => s_Load_Timer_Lost,
       Update_Timer_Lost  => s_Update_Timer_Lost,
              
       Timer_Lost =>   s_Timer_Lost, -- signal 6bits    
       
       -- Sortie du module Mode --
       Game_Lost  => Game_Lost
     );



end archi;
       
