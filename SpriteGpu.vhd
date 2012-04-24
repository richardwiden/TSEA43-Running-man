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
subtype test is integer  range 0 to 799;
type position is array (0 to 3) of test;
signal sprite_brick : bit_array ;
signal sprite_gubbe:  gubb_array;

signal x_pos : position  := (others => 100);
signal y_pos : position  := (others => 210);

signal spriteSize : integer := 16;
signal gubbSize : integer := 32;
signal btnuPressed: std_logic;
begin
y_pos(0) <= 210;
x_pos(0) <= 100;

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

sprite_gubbe( 0) <= "0000011100011100";
sprite_gubbe( 1) <= "0000110000001110";
sprite_gubbe( 2) <= "0001100111000111";
sprite_gubbe( 3) <= "0011001111100111";
sprite_gubbe( 4) <= "0011001111100111";
sprite_gubbe( 5) <= "0111001111000111";
sprite_gubbe( 6) <= "0111000110001110";
sprite_gubbe( 7) <= "0111111111111110";
sprite_gubbe( 8) <= "0111111111111110";
sprite_gubbe( 9) <= "0111111111111100";
sprite_gubbe(10) <= "0111111111111100";
sprite_gubbe(11) <= "0011111111111100";
sprite_gubbe(12) <= "0011111111111100";
sprite_gubbe(13) <= "0011111111111100";
sprite_gubbe(14) <= "0001111111111000";
sprite_gubbe(15) <= "0001111111111000";
sprite_gubbe(16) <= "0001111111111000";
sprite_gubbe(17) <= "0001111111111000";
sprite_gubbe(18) <= "0001111111111000";
sprite_gubbe(19) <= "0001111101111100";
sprite_gubbe(20) <= "0011111000111110";
sprite_gubbe(21) <= "0011111000111110";
sprite_gubbe(22) <= "0011111000111110";
sprite_gubbe(23) <= "0011111000111110";
sprite_gubbe(24) <= "0111110000111110";
sprite_gubbe(25) <= "1111100000111100";
sprite_gubbe(26) <= "1111100000111000";
sprite_gubbe(27) <= "1111000000111000";
sprite_gubbe(28) <= "1111000000111000";
sprite_gubbe(29) <= "1111000000111100";
sprite_gubbe(30) <= "1111111000111111";
sprite_gubbe(31) <= "1111111000111111";

process(clk)
begin
	if rising_edge(clk) then
		if btnu = '1' then
			if(btnuPressed = '0') then
				y_pos(0) <= y_pos(0)-1;
			end if;
			btnuPressed<='1';
		elsif btnd='1' then
			if(btnuPressed ='0') then
				y_pos(0) <= y_pos(0)+1;
			end if;
			btnuPressed<='1';
		else
			btnuPressed<='0';
		end if;
		
		if y>y_pos(0) and y <= (y_pos(0)+spriteSize) then
			if x> x_pos(0) and x <= (x_pos(0)+spriteSize) then
				if sprite_brick( y - y_pos(0) )( x - x_pos(0) ) = '1' then
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

