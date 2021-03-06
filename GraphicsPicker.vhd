----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:08:06 04/18/2012 
-- Design Name: 
-- Module Name:    GraphicsPicker - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity GraphicsPicker is --Best�mmer vad vi ska rita p� vilka delar av sk�rmen.
	Port ( 
	
		clk : in  STD_LOGIC;
		tileVgaRed: in  std_logic_vector(2 downto 0);					
		tileVgaGreen: in  std_logic_vector(2 downto 0);		
		tileVgaBlue: in  std_logic_vector(2 downto 1);
		spriteVgaRed: in  std_logic_vector(2 downto 0);					
		spriteVgaGreen: in  std_logic_vector(2 downto 0);		
		spriteVgaBlue: in  std_logic_vector(2 downto 1);
		y : in  std_logic_vector (10 downto 0);
		x : in  std_logic_vector (10 downto 0);
		vgaRed: OUT  std_logic_vector(2 downto 0);					
		vgaGreen: OUT  std_logic_vector(2 downto 0);		
		vgaBlue: OUT  std_logic_vector(2 downto 1);
		spriteDetected: in std_logic
	);
end GraphicsPicker;

architecture Behavioral of GraphicsPicker is

begin 
				
process(clk)
begin
if rising_edge(clk) then
	if y>"00010010110" and y<"00111100000" then --F�r 150<y<480 ska vi rita sprites
		if x<"01010000000" then --Vi ska rita till 640 i x-led
			if spriteDetected = '1' then
				vgaRed<=spriteVgaRed;	
				vgaGreen<=spriteVgaGreen;
				vgaBlue<=spriteVgaBlue;
			elsif y>"00100010010" then --F�r y>274 ritar vi ut "gr�s"
				vgaRed<="000";
				vgaGreen<="010";
				vgaBlue<="00";
			elsif y>"00100001000" then  --F�r y>264 ritar vi ut "stig"
				vgaRed<="100";
				vgaGreen<="010";
				vgaBlue<="01";	
			else --H�r ritar vi ut "himmel"
				vgaRed<="010";
				vgaGreen<="101";
				vgaBlue<="10";
			end if;
		else --Utanf�r sk�rmen ritar vi svart
			vgaRed<="000";
			vgaGreen<="000";
			vgaBlue<="00";
		end if;
	elsif y<="00010010110" then --y<=150 ska tiles ritas ut
		if x<"1010000000" then --x<640
			vgaRed<=tileVgaRed;	
			vgaGreen<=tileVgaGreen;
			vgaBlue<=tileVgaBlue;	
		else --Utanf�r sk�rmen ritar vi svart
			vgaRed<="000";
			vgaGreen<="000";
			vgaBlue<="00";			
		end if;
	else --Utanf�r sk�rmen ritar vi svart
		vgaRed<="000";
		vgaGreen<="000";
		vgaBlue<="00";
	end if;
end if;
end process;

end Behavioral;

