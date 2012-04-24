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
				rst : in  STD_LOGIC;
				btnd: in std_logic;
				btnu: in std_logic);
end SpriteGpu;


architecture Behavioral of SpriteGpu is

subtype elements is std_logic_vector(15 downto 0);
type bit_array is array (0 to 15) of elements;
type gubb_array is array (0 to 31) of elements;
type boxes_array is array (0 to 2) of bit_array;
signal bitarna : boxes_array ;

signal x_pos : integer := 100;
signal y_pos : integer := 210;
signal spriteSize : integer := 16;
signal btnuPressed: std_logic;
begin


bitarna( 0)( 0) <= "1111111111111111"; 
bitarna(0)( 1) <= "1001001001001001"; 
bitarna(0)( 2) <= "1010010010010011"; 
bitarna(0)( 3) <= "1100100100100101"; 
bitarna(0)( 4) <= "1001001001001001"; 
bitarna(0)( 5) <= "1010010010010011"; 
bitarna(0)( 6) <= "1100100100100101"; 
bitarna(0)( 7) <= "1001001001001001"; 
bitarna(0)( 8) <= "1010010010010011"; 
bitarna(0)( 9) <= "1100100100100101"; 
bitarna(0)(10) <= "1001001001001001"; 
bitarna(0)(11) <= "1010010010010011"; 
bitarna(0)(12) <= "1100100100100101"; 
bitarna(0)(13) <= "1001001001001001"; 
bitarna(0)(14) <= "1010010010010011"; 
bitarna(0)(15) <= "1111111111111111";


process(clk)
begin
	if rising_edge(clk) then
		if btnu = '1' then
			if(btnuPressed = '0') then
				y_pos <= y_pos-1;
			end if;
			btnuPressed<='1';
		elsif btnd='1' then
			if(btnuPressed ='0') then
				y_pos <= y_pos+1;
			end if;
			btnuPressed<='1';
		else
			btnuPressed<='0';
		end if;
		
		if y>y_pos and y <= (y_pos+spriteSize) then
			if x> x_pos and x <= (x_pos+spriteSize) then
				if bitarna(0)( y - y_pos )( x - x_pos ) = '1' then
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

