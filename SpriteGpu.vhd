----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:03:27 04/23/2012 
-- Design Name: 
-- Module Name:    SpriteGpu - Behavioral 
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

entity SpriteGpu is
    Port ( 	clk : in  STD_LOGIC;
				x : in  integer;
				y : in  integer;
				spriteVgaRed: out  std_logic_vector(2 downto 0);					
				spriteVgaGreen: out  std_logic_vector(2 downto 0);		
				spriteVgaBlue: out  std_logic_vector(2 downto 1);
				collision: out std_logic;
				spriteDetected: out std_logic;
				rst : in  STD_LOGIC);
end SpriteGpu;


architecture Behavioral of SpriteGpu is

subtype elements is std_logic_vector(15 downto 0);
type bit_array is array (0 to 15) of elements;
signal sprite_brick : bit_array ;

signal x_pos : integer := 100;
signal y_pos : integer := 210;
signal spriteSize : integer := 16;
begin


sprite_brick( 0) <= "1111111111111111"; 
sprite_brick( 1) <= "1001001001001001"; 
sprite_brick( 2) <= "1010010010010011"; 
sprite_brick( 3) <= "1100100100100101"; 
sprite_brick( 4) <= "1001001001001001"; 
sprite_brick( 5) <= "1010010010010011"; 
sprite_brick( 6) <= "1100100100100101"; 
sprite_brick( 7) <= "1001001001001001"; 
sprite_brick( 8) <= "1010010010010011"; 
sprite_brick( 9) <= "1100100100100101"; 
sprite_brick(10) <= "1001001001001001"; 
sprite_brick(11) <= "1010010010010011"; 
sprite_brick(12) <= "1100100100100101"; 
sprite_brick(13) <= "1001001001001001"; 
sprite_brick(14) <= "1010010010010011"; 
sprite_brick(15) <= "1111111111111111"; 

process(clk)
begin
	if rising_edge(clk) then
		if y>y_pos and y <= (y_pos+spriteSize) then
			if x> x_pos and x <= (x_pos+spriteSize) then
				if sprite_brick( y - y_pos )( x - x_pos ) = '1' then
					spriteVgaRed<="111";				
					spriteVgaGreen<="111";
					spriteVgaBlue<="11";
					spriteDetected<='1';
				else
					spriteDetected<='0';
				end if;
			else
					spriteDetected<='0';	
			end if;	
		else
					spriteDetected<='0';
		end if;	
	end if;
end process;

end Behavioral;

