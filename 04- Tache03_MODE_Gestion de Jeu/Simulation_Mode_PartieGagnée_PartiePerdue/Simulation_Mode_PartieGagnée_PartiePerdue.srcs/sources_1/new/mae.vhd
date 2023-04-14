---------------------------------------------------
-- SORBONNE UNIVERSITE                             
-- Students:  Zahra Benslimane & Hiba Khechai      
--                                                 
-- 3) MAE:                                         
--    ? Machine à états pour gérer                 
--         o Les sorties Brick_Win et Pause        
--         o Les deux compteurs Tempo Pause et     
--         Timer Lost                              
---------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MAE  is
port (
       Clk25  : in  std_logic;       --Horloge 25 MHz
       Reset  :in std_logic;
       
       Endframe  :in std_logic;      
       Pause_Rqt :in std_logic;      
       Lost  : in std_logic;         
       No_Brick : in std_logic;  
       Fin_Tempo_Pause : in std_logic;
       Timer_Lost : in std_logic_vector (5 downto 0);
       
       RAZ_Tempo_Pause    : out std_logic;
       Update_Tempo_Pause : out std_logic;
       
       Load_Timer_Lost   : out std_logic;
       Update_Timer_Lost : out std_logic;
       
       Pause     : out std_logic;    
       Brick_Win : out std_logic     
       
     );
end MAE ;     
architecture archi of MAE  is

--décaration des états de la machine 
type etat is ( S0, S1, S2, S3, S4, S5, S6, S7);
-- déclaration des signaux intermériaires
signal FUT,PRES : etat;

begin
----------------------------------------------
-- 		PROCESS DU REGISTRE D'ETAT 		    --
----------------------------------------------

process(Reset, Clk25) 
begin

if (Reset = '0') then 

         PRES <= S0;  --Retour à l'état initial     

elsif ( rising_edge (Clk25) ) then

 	     PRES <= FUT;
end if;
end process;

----------------------------------------------
-- 		PROCESS DE CALCUL DE L'ETAT FUTUR	--
----------------------------------------------

-- LISTE DE SENSIBILITE : etat present + les entrées
process( PRES, Endframe, Pause_Rqt, Lost, No_Brick, Fin_Tempo_Pause,Timer_Lost )

begin

case ( PRES ) is

when S0 => FUT <= S0; if Pause_Rqt ='1' then FUT <= S1; end if;

when S1 => FUT <=S1; if (Pause_Rqt='0' and Fin_Tempo_Pause='1') then FUT<= S2; end if;

when S2 =>FUT <=S2; if Pause_Rqt='1' then FUT<= S3;
         elsif( No_Brick='1') then FUT <= S5;
         elsif (Lost='1') then FUT <= S4;
         end if;


when S3 => FUT <= S3; if (Pause_Rqt ='0' and Fin_Tempo_Pause='1') then FUT <= S0; end if;

when S4 => FUT <= S6;

when S5 => FUT <= S5;
when S6 => FUT <= S6; if (Endframe ='1' and (Timer_Lost > 0)) then FUT <= S7;
                      elsif Timer_Lost ="000000" then FUT <=S0; end if ;
                      
when S7 => FUT <= S6; 
 
end case;
end process;

----------------------------------------------
-- 		PROCESS DE CALCUL DES SORTIES 		--
----------------------------------------------
process (PRES)
begin

case (PRES) is

when S0 => RAZ_Tempo_Pause    <= '1' ;
           Update_Tempo_Pause <= '0' ;
           
           Load_Timer_Lost    <= '0' ;
           Update_Timer_Lost  <= '0' ;
           
           Pause       <= '1' ;
           Brick_Win   <= '0' ;
           
           
when S1 => RAZ_Tempo_Pause    <= '0' ;
           Update_Tempo_Pause <= '1' ;
           
           Load_Timer_Lost    <= '0' ;
           Update_Timer_Lost  <= '0' ;
           
           Pause       <= '0' ;
           Brick_Win   <= '0' ;


when S2 => RAZ_Tempo_Pause    <= '1' ;
           Update_Tempo_Pause <= '0' ;
           
           Load_Timer_Lost    <= '0' ;
           Update_Timer_Lost  <= '0' ;
           
           Pause       <= '0' ;
           Brick_Win   <= '0' ;
           

when S3 => RAZ_Tempo_Pause    <= '0' ;
           Update_Tempo_Pause <= '1' ;
           
           Load_Timer_Lost    <= '0' ;
           Update_Timer_Lost  <= '0' ;
           
           Pause       <= '0' ;
           Brick_Win   <= '0' ;
           

when S4 => RAZ_Tempo_Pause    <= '0' ;
           Update_Tempo_Pause <= '0' ;
           
           Load_Timer_Lost    <= '1' ;
           Update_Timer_Lost  <= '0' ;
           
           Pause       <= '0' ;
           Brick_Win   <= '0' ;
           
when S5 => RAZ_Tempo_Pause    <= '0' ;
           Update_Tempo_Pause <= '0' ;
           
           Load_Timer_Lost    <= '0' ;
           Update_Timer_Lost  <= '0' ;
          
           Pause       <= '0' ;
           Brick_Win   <= '1' ;    
           
           
when S6 => RAZ_Tempo_Pause    <= '0' ;
           Update_Tempo_Pause <= '0' ;
           
           Load_Timer_Lost    <= '0' ;
           Update_Timer_Lost  <= '0' ;
           
           Pause       <= '1' ;
           Brick_Win   <= '0' ;   
           
           
           
when S7 => RAZ_Tempo_Pause    <= '0' ;
           Update_Tempo_Pause <= '0' ;
           
           Load_Timer_Lost    <= '0' ;
           Update_Timer_Lost  <= '1' ;
           
           Pause       <= '0' ;
           Brick_Win   <= '0' ;   
           
                     
end case;
end process;

end archi;