library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity MAE is
port (      Clk, Reset     : in std_logic;  --cadencée par l'horloge à 100 MHz

            RED_Out   : in std_logic_vector(3 downto 0); --Sorties du cpt red sur 5bits
            GREEN_Out : in std_logic_vector(3 downto 0); --Sorties du cpt green sur 5bits
            BLUE_Out  : in std_logic_vector(3 downto 0); --Sorties du cpt blue sur 5bits
            
            B1B0 : out std_logic_vector(1 downto 0);   --Commande MUX cpt blue sur 2bits
            R1R0 : out std_logic_vector(1 downto 0);   --Commande MUX cpt red sur 2bits
            G1G0 : out std_logic_vector(1 downto 0) ); --Commande MUX cpt red sur 2bits
end MAE;


architecture archi of MAE is

type etat is ( PHASE1, PHASE2, PHASE3);
signal FUT,PRES : etat;

begin
----------------------------

process(Reset, Clk)
begin

if (Reset = '0') then 

         PRES <= phase1;       

elsif ( rising_edge (Clk) ) then

 	     PRES <= FUT;
end if;
end process;

----------------------------
-- compinatoire des etats future

process ( PRES,RED_Out, GREEN_Out, BLUE_Out )
begin

case (PRES) is 
  
  when PHASE1 => FUT <= PHASE1 ; if GREEN_Out = "1111" then FUT <= PHASE2 ;end if;
  when PHASE2 => FUT <= PHASE2 ; if BLUE_Out = "1111" then FUT <= PHASE3 ; end if;
  when PHASE3 => FUT <= PHASE3 ;  if RED_Out = "1111" then FUT <= PHASE1 ; end if;
  
end case ;

end process;  


--combinatoire des sorties 

process (PRES)
begin


case(PRES) is 

when PHASE1 => B1B0<= "11" ; --memo
               R1R0 <= "10"; --décrém
               G1G0 <= "01"; --incrém
               
               
when PHASE2 => B1B0<= "01" ; --incrém
               R1R0 <= "11"; --memo
               G1G0 <= "10"; --décrém
               
when PHASE3 => B1B0<= "10" ; --décrém
               R1R0 <= "01"; --incrém
               G1G0 <= "11"; --memo
when others => NULL;



end case ;
end process;

end archi;