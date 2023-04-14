## This file is a general .xdc for the Nexys4 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
#Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports clk100]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk100]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk100]
 
# Switches
#Bank = 34, Pin name = IO_L21P_T3_DQS_34,					Sch name = SW0
set_property PACKAGE_PIN U9 [get_ports {S0}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S0}]
#Bank = 34, Pin name = IO_25_34,							Sch name = SW1
set_property PACKAGE_PIN U8 [get_ports {S1}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S1}]
#Bank = 34, Pin name = IO_L23P_T3_34,						Sch name = SW2
set_property PACKAGE_PIN R7 [get_ports {S2}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S2}]
#Bank = 34, Pin name = IO_L19P_T3_34,						Sch name = SW3
set_property PACKAGE_PIN R6 [get_ports {S3}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S3}]
##Bank = 34, Pin name = IO_L19N_T3_VREF_34,					Sch name = SW4
#set_property PACKAGE_PIN R5 [get_ports {sw[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
##Bank = 34, Pin name = IO_L20P_T3_34,						Sch name = SW5
#set_property PACKAGE_PIN V7 [get_ports {sw[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
##Bank = 34, Pin name = IO_L20N_T3_34,						Sch name = SW6
#set_property PACKAGE_PIN V6 [get_ports {sw[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
##Bank = 34, Pin name = IO_L10P_T1_34,						Sch name = SW7
#set_property PACKAGE_PIN V5 [get_ports {sw[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
##Bank = 34, Pin name = IO_L8P_T1-34,						Sch name = SW8
#set_property PACKAGE_PIN U4 [get_ports {sw[8]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
##Bank = 34, Pin name = IO_L9N_T1_DQS_34,					Sch name = SW9
#set_property PACKAGE_PIN V2 [get_ports {sw[9]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
##Bank = 34, Pin name = IO_L9P_T1_DQS_34,					Sch name = SW10
#set_property PACKAGE_PIN U2 [get_ports {sw[10]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
##Bank = 34, Pin name = IO_L11N_T1_MRCC_34,					Sch name = SW11
#set_property PACKAGE_PIN T3 [get_ports {sw[11]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
##Bank = 34, Pin name = IO_L17N_T2_34,						Sch name = SW12
#set_property PACKAGE_PIN T1 [get_ports {sw[12]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
##Bank = 34, Pin name = IO_L11P_T1_SRCC_34,					Sch name = SW13
#set_property PACKAGE_PIN R3 [get_ports {sw[13]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
##Bank = 34, Pin name = IO_L14N_T2_SRCC_34,					Sch name = SW14
#set_property PACKAGE_PIN P3 [get_ports {sw[14]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
#Bank = 34, Pin name = IO_L14P_T2_SRCC_34,					Sch name = SW15
set_property PACKAGE_PIN P4 [get_ports {S15}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S15}]
 


# LEDs
#Bank = 34, Pin name = IO_L24N_T3_34,						Sch name = LED0
set_property PACKAGE_PIN T8 [get_ports {led[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
#Bank = 34, Pin name = IO_L21N_T3_DQS_34,					Sch name = LED1
set_property PACKAGE_PIN V9 [get_ports {led[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
#Bank = 34, Pin name = IO_L24P_T3_34,						Sch name = LED2
set_property PACKAGE_PIN R8 [get_ports {led[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
#Bank = 34, Pin name = IO_L23N_T3_34,						Sch name = LED3
set_property PACKAGE_PIN T6 [get_ports {led[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
#Bank = 34, Pin name = IO_L12P_T1_MRCC_34,					Sch name = LED4
set_property PACKAGE_PIN T5 [get_ports {led[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
#Bank = 34, Pin name = IO_L12N_T1_MRCC_34,					Sch	name = LED5
set_property PACKAGE_PIN T4 [get_ports {led[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
#Bank = 34, Pin name = IO_L22P_T3_34,						Sch name = LED6
set_property PACKAGE_PIN U7 [get_ports {led[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
#Bank = 34, Pin name = IO_L22N_T3_34,						Sch name = LED7
set_property PACKAGE_PIN U6 [get_ports {led[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
#Bank = 34, Pin name = IO_L10N_T1_34,						Sch name = LED8
set_property PACKAGE_PIN V4 [get_ports {led[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
#Bank = 34, Pin name = IO_L8N_T1_34,						Sch name = LED9
set_property PACKAGE_PIN U3 [get_ports {led[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
#Bank = 34, Pin name = IO_L7N_T1_34,						Sch name = LED10
set_property PACKAGE_PIN V1 [get_ports {led[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
#Bank = 34, Pin name = IO_L17P_T2_34,						Sch name = LED11
set_property PACKAGE_PIN R1 [get_ports {led[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
##Bank = 34, Pin name = IO_L13N_T2_MRCC_34,					Sch name = LED12
#set_property PACKAGE_PIN P5 [get_ports {led[12]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
##Bank = 34, Pin name = IO_L7P_T1_34,						Sch name = LED13
#set_property PACKAGE_PIN U1 [get_ports {led[13]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}]
##Bank = 34, Pin name = IO_L15N_T2_DQS_34,					Sch name = LED14
#set_property PACKAGE_PIN R2 [get_ports {led[14]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[14]}]
##Bank = 34, Pin name = IO_L15P_T2_DQS_34,					Sch name = LED15
#set_property PACKAGE_PIN P2 [get_ports {led[15]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[15]}]

##Bank = 34, Pin name = IO_L5P_T0_34,						Sch name = LED16_R
#set_property PACKAGE_PIN K5 [get_ports RGB1_Red]					
	#set_property IOSTANDARD LVCMOS33 [get_ports RGB1_Red]
##Bank = 15, Pin name = IO_L5P_T0_AD9P_15,					Sch name = LED16_G
#set_property PACKAGE_PIN F13 [get_ports RGB1_Green]				
	#set_property IOSTANDARD LVCMOS33 [get_ports RGB1_Green]
##Bank = 35, Pin name = IO_L19N_T3_VREF_35,					Sch name = LED16_B
#set_property PACKAGE_PIN F6 [get_ports RGB1_Blue]					
	#set_property IOSTANDARD LVCMOS33 [get_ports RGB1_Blue]
##Bank = 34, Pin name = IO_0_34,								Sch name = LED17_R
#set_property PACKAGE_PIN K6 [get_ports RGB2_Red]					
	#set_property IOSTANDARD LVCMOS33 [get_ports RGB2_Red]
##Bank = 35, Pin name = IO_24P_T3_35,						Sch name =  LED17_G
#set_property PACKAGE_PIN H6 [get_ports RGB2_Green]					
	#set_property IOSTANDARD LVCMOS33 [get_ports RGB2_Green]
##Bank = CONFIG, Pin name = IO_L3N_T0_DQS_EMCCLK_14,			Sch name = LED17_B
#set_property PACKAGE_PIN L16 [get_ports RGB2_Blue]					
	#set_property IOSTANDARD LVCMOS33 [get_ports RGB2_Blue]



#Buttons
#Bank = 15, Pin name = IO_L11N_T1_SRCC_15,					Sch name = BTNC
set_property PACKAGE_PIN E16 [get_ports centre]						
	set_property IOSTANDARD LVCMOS33 [get_ports centre]
#Bank = 15, Pin name = IO_L14P_T2_SRCC_15,					Sch name = BTNU
set_property PACKAGE_PIN F15 [get_ports nord]						
	set_property IOSTANDARD LVCMOS33 [get_ports nord]
#Bank = CONFIG, Pin name = IO_L15N_T2_DQS_DOUT_CSO_B_14,	Sch name = BTNL
set_property PACKAGE_PIN T16 [get_ports ouest]						
	set_property IOSTANDARD LVCMOS33 [get_ports ouest]
#Bank = 14, Pin name = IO_25_14,							Sch name = BTNR
set_property PACKAGE_PIN R10 [get_ports est]						
	set_property IOSTANDARD LVCMOS33 [get_ports est]
#Bank = 14, Pin name = IO_L21P_T3_DQS_14,					Sch name = BTND
set_property PACKAGE_PIN V10 [get_ports sud]						
	set_property IOSTANDARD LVCMOS33 [get_ports sud]



#7 segment display
#Bank = 34, Pin name = IO_L2N_T0_34,						Sch name = CA
set_property PACKAGE_PIN L3 [get_ports {SEG[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[0]}]
#Bank = 34, Pin name = IO_L3N_T0_DQS_34,					Sch name = CB
set_property PACKAGE_PIN N1 [get_ports {SEG[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[1]}]
#Bank = 34, Pin name = IO_L6N_T0_VREF_34,					Sch name = CC
set_property PACKAGE_PIN L5 [get_ports {SEG[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[2]}]
#Bank = 34, Pin name = IO_L5N_T0_34,						Sch name = CD
set_property PACKAGE_PIN L4 [get_ports {SEG[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[3]}]
#Bank = 34, Pin name = IO_L2P_T0_34,						Sch name = CE
set_property PACKAGE_PIN K3 [get_ports {SEG[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[4]}]
#Bank = 34, Pin name = IO_L4N_T0_34,						Sch name = CF
set_property PACKAGE_PIN M2 [get_ports {SEG[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[5]}]
#Bank = 34, Pin name = IO_L6P_T0_34,						Sch name = CG
set_property PACKAGE_PIN L6 [get_ports {SEG[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[6]}]

#Bank = 34, Pin name = IO_L16P_T2_34,						Sch name = DP
set_property PACKAGE_PIN M4 [get_ports {SEG[7]}]							
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[7]}]

#Bank = 34, Pin name = IO_L18N_T2_34,						Sch name = AN0
set_property PACKAGE_PIN N6 [get_ports {SEL_SEG[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEL_SEG[0]}]
#Bank = 34, Pin name = IO_L18P_T2_34,						Sch name = AN1
set_property PACKAGE_PIN M6 [get_ports {SEL_SEG[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEL_SEG[1]}]
#Bank = 34, Pin name = IO_L4P_T0_34,						Sch name = AN2
set_property PACKAGE_PIN M3 [get_ports {SEL_SEG[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEL_SEG[2]}]
#Bank = 34, Pin name = IO_L13_T2_MRCC_34,					Sch name = AN3
set_property PACKAGE_PIN N5 [get_ports {SEL_SEG[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEL_SEG[3]}]
#Bank = 34, Pin name = IO_L3P_T0_DQS_34,					Sch name = AN4
set_property PACKAGE_PIN N2 [get_ports {SEL_SEG[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEL_SEG[4]}]
#Bank = 34, Pin name = IO_L16N_T2_34,						Sch name = AN5
set_property PACKAGE_PIN N4 [get_ports {SEL_SEG[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEL_SEG[5]}]
#Bank = 34, Pin name = IO_L1P_T0_34,						Sch name = AN6
set_property PACKAGE_PIN L1 [get_ports {SEL_SEG[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEL_SEG[6]}]
#Bank = 34, Pin name = IO_L1N_T034,							Sch name = AN7
set_property PACKAGE_PIN M1 [get_ports {SEL_SEG[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEL_SEG[7]}]
	


#Pmod Header JB
#Bank = 15, Pin name = IO_L15N_T2_DQS_ADV_B_15,				Sch name = JB1
set_property PACKAGE_PIN G14 [get_ports {rx_left}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rx_left}]
#Bank = 14, Pin name = IO_L13P_T2_MRCC_14,					Sch name = JB2
set_property PACKAGE_PIN P15 [get_ports {rx_right}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rx_right}]
##Bank = 14, Pin name = IO_L21N_T3_DQS_A06_D22_14,			Sch name = JB3
#set_property PACKAGE_PIN V11 [get_ports {JB[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[2]}]
##Bank = CONFIG, Pin name = IO_L16P_T2_CSI_B_14,				Sch name = JB4
#set_property PACKAGE_PIN V15 [get_ports {JB[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[3]}]
#Bank = 15, Pin name = IO_25_15,							Sch name = JB7
set_property PACKAGE_PIN K16 [get_ports {rot_a_console}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rot_a_console}]
#Bank = CONFIG, Pin name = IO_L15P_T2_DQS_RWR_B_14,			Sch name = JB8
set_property PACKAGE_PIN R16 [get_ports {rot_b_console}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rot_b_console}]
##Bank = 14, Pin name = IO_L24P_T3_A01_D17_14,				Sch name = JB9
#set_property PACKAGE_PIN T9 [get_ports {JB[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[6]}]
##Bank = 14, Pin name = IO_L19N_T3_A09_D25_VREF_14,			Sch name = JB10 
#set_property PACKAGE_PIN U11 [get_ports {JB[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[7]}]
 


#Pmod Header JC
#Bank = 35, Pin name = IO_L23P_T3_35,						Sch name = JC1
set_property PACKAGE_PIN K2 [get_ports {tx_right}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {tx_right}]
#Bank = 35, Pin name = IO_L6P_T0_35,						Sch name = JC2
set_property PACKAGE_PIN E7 [get_ports {tx_left}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {tx_left}]
##Bank = 35, Pin name = IO_L22P_T3_35,						Sch name = JC3
#set_property PACKAGE_PIN J3 [get_ports {JC[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[2]}]
##Bank = 35, Pin name = IO_L21P_T3_DQS_35,					Sch name = JC4
#set_property PACKAGE_PIN J4 [get_ports {JC[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[3]}]
#Bank = 35, Pin name = IO_L23N_T3_35,						Sch name = JC7
set_property PACKAGE_PIN K1 [get_ports {rot_a_manette}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rot_a_manette}]
#Bank = 35, Pin name = IO_L5P_T0_AD13P_35,					Sch name = JC8
set_property PACKAGE_PIN E6 [get_ports {rot_b_manette}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {rot_b_manette}]
##Bank = 35, Pin name = IO_L22N_T3_35,						Sch name = JC9
#set_property PACKAGE_PIN J2 [get_ports {JC[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[6]}]
##Bank = 35, Pin name = IO_L19P_T3_35,						Sch name = JC10
#set_property PACKAGE_PIN G6 [get_ports {JC[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[7]}]
 

 
#VGA Connector
##Bank = 35, Pin name = IO_L8N_T1_AD14N_35,					Sch name = VGA_R0
set_property PACKAGE_PIN A3 [get_ports {vga_red[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[0]}]
##Bank = 35, Pin name = IO_L7N_T1_AD6N_35,					Sch name = VGA_R1
set_property PACKAGE_PIN B4 [get_ports {vga_red[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[1]}]
##Bank = 35, Pin name = IO_L1N_T0_AD4N_35,					Sch name = VGA_R2
set_property PACKAGE_PIN C5 [get_ports {vga_red[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[2]}]
#Bank = 35, Pin name = IO_L8P_T1_AD14P_35,					Sch name = VGA_R3
set_property PACKAGE_PIN A4 [get_ports {VGA_red[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_red[3]}]
##Bank = 35, Pin name = IO_L2P_T0_AD12P_35,					Sch name = VGA_B0
set_property PACKAGE_PIN B7 [get_ports {vga_blue[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[0]}]
##Bank = 35, Pin name = IO_L4N_T0_35,						Sch name = VGA_B1
set_property PACKAGE_PIN C7 [get_ports {vga_blue[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[1]}]
##Bank = 35, Pin name = IO_L6N_T0_VREF_35,					Sch name = VGA_B2
set_property PACKAGE_PIN D7 [get_ports {vga_blue[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[2]}]
#Bank = 35, Pin name = IO_L4P_T0_35,						Sch name = VGA_B3
set_property PACKAGE_PIN D8 [get_ports {VGA_blue[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_blue[3]}]
##Bank = 35, Pin name = IO_L1P_T0_AD4P_35,					Sch name = VGA_G0
set_property PACKAGE_PIN C6 [get_ports {vga_green[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[0]}]
##Bank = 35, Pin name = IO_L3N_T0_DQS_AD5N_35,				Sch name = VGA_G1
set_property PACKAGE_PIN A5 [get_ports {vga_green[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[1]}]
##Bank = 35, Pin name = IO_L2N_T0_AD12N_35,					Sch name = VGA_G2
set_property PACKAGE_PIN B6 [get_ports {vga_green[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[2]}]
#Bank = 35, Pin name = IO_L3P_T0_DQS_AD5P_35,				Sch name = VGA_G3
set_property PACKAGE_PIN A6 [get_ports {VGA_green[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_green[3]}]
#Bank = 15, Pin name = IO_L4P_T0_15,						Sch name = VGA_HS
set_property PACKAGE_PIN B11 [get_ports hsync]						
	set_property IOSTANDARD LVCMOS33 [get_ports hsync]
#Bank = 15, Pin name = IO_L3N_T0_DQS_AD1N_15,				Sch name = VGA_VS
set_property PACKAGE_PIN B12 [get_ports vsync]						
	set_property IOSTANDARD LVCMOS33 [get_ports vsync]




#Accelerometer
#Bank = 15, Pin name = IO_L6N_T0_VREF_15,					Sch name = ACL_MISO
set_property PACKAGE_PIN D13 [get_ports SDI]					
	set_property IOSTANDARD LVCMOS33 [get_ports SDI]
#Bank = 15, Pin name = IO_L2N_T0_AD8N_15,					Sch name = ACL_MOSI
set_property PACKAGE_PIN B14 [get_ports SDO]					
	set_property IOSTANDARD LVCMOS33 [get_ports SDO]
#Bank = 15, Pin name = IO_L12P_T1_MRCC_15,					Sch name = ACL_SCLK
set_property PACKAGE_PIN D15 [get_ports SCLK]					
	set_property IOSTANDARD LVCMOS33 [get_ports SCLK]
#Bank = 15, Pin name = IO_L12N_T1_MRCC_15,					Sch name = ACL_CSN
set_property PACKAGE_PIN C15 [get_ports SS]						
	set_property IOSTANDARD LVCMOS33 [get_ports SS]
