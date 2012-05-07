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
	if y>"10010110" and y<"111100000" then -- 150 480
		if x<"1010000000" then --640
			if spriteDetected = '1' then
				vgaRed<=spriteVgaRed;	
				vgaGreen<=spriteVgaGreen;
				vgaBlue<=spriteVgaBlue;
			elsif y>"100010010" then --274
				vgaRed<="000";
				vgaGreen<="000";
				vgaBlue<="00";
			elsif y>"100001000" then  --264
				vgaRed<="100";
				vgaGreen<="010";
				vgaBlue<="01";	
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
	elsif y<="10010110" then --150
		if x<"1010000000" then --640
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

