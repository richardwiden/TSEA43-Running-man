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
		y : in  integer range 0 to 521;
		x : in  integer range 0 to 800;
		vgaRed: OUT  std_logic_vector(2 downto 0);					
		vgaGreen: OUT  std_logic_vector(2 downto 0);		
		vgaBlue: OUT  std_logic_vector(2 downto 1)
	);
end GraphicsPicker;

architecture Behavioral of GraphicsPicker is

begin 
process(clk)
begin
if rising_edge(clk) then
	if y>200 and x>200 then
		vgaRed<=spriteVgaRed;	
		vgaGreen<=spriteVgaGreen;
		vgaBlue<=spriteVgaBlue;	
	else
		vgaRed<=tileVgaRed;	
		vgaGreen<=tileVgaGreen;
		vgaBlue<=tileVgaBlue;
	end if;
end if;
end process;

end Behavioral;

