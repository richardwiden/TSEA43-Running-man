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

entity GraphicsPicker is
	Port ( 
		clk : in  STD_LOGIC;
		tileVgaRed: in  std_logic_vector(2 downto 0);					
		tileVgaGreen: in  std_logic_vector(2 downto 0);		
		tileVgaBlue: in  std_logic_vector(2 downto 1);
		spriteVgaRed: in  std_logic_vector(2 downto 0);					
		spriteVgaGreen: in  std_logic_vector(2 downto 0);		
		spriteVgaBlue: in  std_logic_vector(2 downto 1);
		y : in  integer range 0 to 520;
		x : in  integer range 0 to 799;
		vgaRed: OUT  std_logic_vector(2 downto 0);					
		vgaGreen: OUT  std_logic_vector(2 downto 0);		
		vgaBlue: OUT  std_logic_vector(2 downto 1);
		spriteDetected: in std_logic
	);
end GraphicsPicker;

architecture Behavioral of GraphicsPicker is
signal whiteVgaRed: std_logic_vector(2 downto 0) := "111";					
signal whiteVgaGreen:   std_logic_vector(2 downto 0) := "000";					
signal whiteVgaBlue:   std_logic_vector(2 downto 1) := "00";					
signal	blackVgaRed: std_logic_vector(2 downto 0) := "000";					
signal	blackVgaGreen:   std_logic_vector(2 downto 0) := "000";					
signal	blackVgaBlue:   std_logic_vector(2 downto 1) := "11";		

begin 
				
process(clk)
begin
if rising_edge(clk) then
	if y>150 and y<480 then
		if x<640 then
			if spriteDetected = '1' then
				vgaRed<=spriteVgaRed;	
				vgaGreen<=spriteVgaGreen;
				vgaBlue<=spriteVgaBlue;
			elsif y>264 then 
				vgaRed<="000";
				vgaGreen<="000";
				vgaBlue<="00";	
			else
				vgaRed<="010";
				vgaGreen<="101";
				vgaBlue<="10";
			end if;
		else
			vgaRed<="000";
			vgaGreen<="000";
			vgaBlue<="00";
		end if;
	elsif y<=150 then
		if x<640 then
			vgaRed<=tileVgaRed;	
			vgaGreen<=tileVgaGreen;
			vgaBlue<=tileVgaBlue;	
		else
			vgaRed<="000";
			vgaGreen<="000";
			vgaBlue<="00";			
		end if;
	else
		vgaRed<="000";
		vgaGreen<="000";
		vgaBlue<="00";
	end if;
end if;
end process;

end Behavioral;

