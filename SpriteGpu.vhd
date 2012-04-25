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
				jump: in std_logic;
				duck: in std_logic;
				move_box: in std_logic;
				put_box: in std_logic;
				next_box: in std_logic);
end SpriteGpu;


architecture Behavioral of SpriteGpu is

subtype elements is std_logic_vector(31 downto 0);
type bit_array is array (0 to 31) of elements;
type gubb_array is array (0 to 64) of elements;
subtype test is integer  range 0 to 799;
type position is array (0 to 7) of test;
signal sprite_brick : bit_array ;
signal sprite_gubbe:  gubb_array;

signal x_pos : position  := (others => 100);
signal y_pos : position  := (others => 200);

signal spriteSize : integer := 32;
signal gubbSize : integer := 64;
signal btnuPressed: std_logic;
begin
x_pos(0) <= 0;
x_pos(1) <= 300;
x_pos(2) <= 600;

sprite_brick( 0) <= "11111111111111111111111111111111"; 
sprite_brick( 1) <= "10010010010010000100100100100101"; 
sprite_brick( 2) <= "11001001001001001001001001001001"; 
sprite_brick( 3) <= "10100100100100100100100100100101";
sprite_brick( 4) <= "10010010010010000100100100100101"; 
sprite_brick( 5) <= "11001001001001001001001001001001"; 
sprite_brick( 6) <= "10100100100100100100100100100101"; 
sprite_brick( 7) <= "10010010010010000100100100100101"; 
sprite_brick( 8) <= "11001001001001001001001001001001"; 
sprite_brick( 9) <= "10100100100100100100100100100101"; 
sprite_brick(10) <= "10010010010010000100100100100101"; 
sprite_brick(11) <= "11001001001001001001001001001001"; 
sprite_brick(12) <= "10100100100100100100100100100101"; 
sprite_brick(13) <= "10010010010010000100100100100101"; 
sprite_brick(14) <= "11001001001001001001001001001001"; 
sprite_brick(15) <= "10100100100100100100100100100101";
sprite_brick(16) <= "10010010010010000100100100100101"; 
sprite_brick(17) <= "11001001001001001001001001001001"; 
sprite_brick(18) <= "10100100100100100100100100100101"; 
sprite_brick(19) <= "10010010010010000100100100100101"; 
sprite_brick(20) <= "11001001001001001001001001001001"; 
sprite_brick(21) <= "10100100100100100100100100100101"; 
sprite_brick(22) <= "10010010010010000100100100100101"; 
sprite_brick(23) <= "11001001001001001001001001001001"; 
sprite_brick(24) <= "10100100100100100100100100100101"; 
sprite_brick(25) <= "10010010010010000100100100100101"; 
sprite_brick(26) <= "11001001001001001001001001001001"; 
sprite_brick(27) <= "10100100100100100100100100100101"; 
sprite_brick(28) <= "10010010010010000100100100100101"; 
sprite_brick(29) <= "11001001001001001001001001001001"; 
sprite_brick(30) <= "10100100100100100100100100100101"; 
sprite_brick(31) <= "11111111111111111111111111111111";  

sprite_gubbe( 0) <= "00000111000111000000011100011100";
sprite_gubbe( 1) <= "00001100000011100000110000001110";
sprite_gubbe( 2) <= "00011001110001110000110000001110";
sprite_gubbe( 3) <= "00110011111001110000110000001110";
sprite_gubbe( 4) <= "00110011111001110000110000001110";
sprite_gubbe( 5) <= "01110011110001110000110000001110";
sprite_gubbe( 6) <= "01110001100011100000110000001110";
sprite_gubbe( 7) <= "01111111111111100000110000001110";
sprite_gubbe( 8) <= "01111111111111100000110000001110";
sprite_gubbe( 9) <= "01111111111111000000110000001110";
sprite_gubbe(10) <= "01111111111111000000110000001110";
sprite_gubbe(11) <= "00111111111111000000110000001110";
sprite_gubbe(12) <= "00111111111111000000110000001110";
sprite_gubbe(13) <= "00111111111111000000110000001110";
sprite_gubbe(14) <= "00011111111110000000110000001110";
sprite_gubbe(15) <= "00011111111110000000110000001110";
sprite_gubbe(16) <= "00011111111110000000110000001110";
sprite_gubbe(17) <= "00011111111110000000110000001110";
sprite_gubbe(18) <= "00011111111110000000110000001110";
sprite_gubbe(19) <= "00011111011111000000110000001110";
sprite_gubbe(20) <= "00111110001111100000110000001110";
sprite_gubbe(21) <= "00111110001111100000110000001110";
sprite_gubbe(22) <= "00111110001111100000110000001110";
sprite_gubbe(23) <= "00111110001111100000110000001110";
sprite_gubbe(24) <= "01111100001111100000110000001110";
sprite_gubbe(25) <= "11111000001111000000110000001110";
sprite_gubbe(26) <= "11111000001110000000110000001110";
sprite_gubbe(27) <= "11110000001110000000110000001110";
sprite_gubbe(28) <= "11110000001110000000110000001110";
sprite_gubbe(29) <= "11110000001111000000110000001110";
sprite_gubbe(30) <= "11111110001111110000110000001110";
sprite_gubbe(31) <= "11111110001111110000110000001110";
sprite_gubbe(32) <= "00000111000111000000011100011100";
sprite_gubbe(33) <= "00001100000011100000110000001110";
sprite_gubbe(34) <= "00011001110001110000110000001110";
sprite_gubbe(35) <= "00110011111001110000110000001110";
sprite_gubbe(36) <= "00110011111001110000110000001110";
sprite_gubbe(37) <= "01110011110001110000110000001110";
sprite_gubbe(38) <= "01110001100011100000110000001110";
sprite_gubbe(39) <= "01111111111111100000110000001110";
sprite_gubbe(40) <= "01111111111111100000110000001110";
sprite_gubbe(41) <= "01111111111111000000110000001110";
sprite_gubbe(42) <= "01111111111111000000110000001110";
sprite_gubbe(43) <= "00111111111111000000110000001110";
sprite_gubbe(44) <= "00111111111111000000110000001110";
sprite_gubbe(45) <= "00111111111111000000110000001110";
sprite_gubbe(46) <= "00011111111110000000110000001110";
sprite_gubbe(47) <= "00011111111110000000110000001110";
sprite_gubbe(48) <= "00011111111110000000110000001110";
sprite_gubbe(49) <= "00011111111110000000110000001110";
sprite_gubbe(50) <= "00011111111110000000110000001110";
sprite_gubbe(51) <= "00011111011111000000110000001110";
sprite_gubbe(52) <= "00111110001111100000110000001110";
sprite_gubbe(53) <= "00111110001111100000110000001110";
sprite_gubbe(54) <= "00111110001111100000110000001110";
sprite_gubbe(55) <= "00111110001111100000110000001110";
sprite_gubbe(56) <= "01111100001111100000110000001110";
sprite_gubbe(57) <= "11111000001111000000110000001110";
sprite_gubbe(58) <= "11111000001110000000110000001110";
sprite_gubbe(59) <= "11110000001110000000110000001110";
sprite_gubbe(60) <= "11110000001110000000110000001110";
sprite_gubbe(61) <= "11110000001111000000110000001110";
sprite_gubbe(62) <= "11111110001111110000110000001110";
sprite_gubbe(63) <= "11111110001111110000110000001110";

process(clk)
variable gubbe: integer :=3;
variable detected: boolean := false;
variable collisionDetected: boolean := false;
begin
	if rising_edge(clk) then
		
		if(jump='1') then
			y_pos(gubbe) <= 178;
		elsif(duck='1') then
			y_pos(gubbe) <= 232;
		else
			y_pos(gubbe) <= 200;
		end if;
		
		if put_box = '1' then
			 if x_pos(0) = 0 then
				x_pos(0) := 800;
				if next_box ='1' then
					y_pos(0) := 200;
				else
					y_pos(0) := 232;
				end if;
			 elsif x_pos(1) = 0 then
				x_pos(1) := 800;
				if next_box ='1' then
					y_pos(1) := 200;
				else
					y_pos(1) := 232;
				end if;
			 elsif x_pos(2) = 0 then
				x_pos(2) := 800;
				if next_box ='1' then
					y_pos(2) := 200;
				else
					y_pos(2) := 232;
				end if;
			 else
			 end if;
		end if;
		
		detected :=false;				

		for i in 2 downto 0 loop
			if y_pos(i) = 0 or x_pos(i) = 0 then
				y_pos(i) <= 0;				
			else
				if y>=y_pos(i) and y < (y_pos(i)+spriteSize) then
					if x>= x_pos(i) and x < (x_pos(i)+spriteSize) then
						if sprite_brick( y - y_pos(i) )( x - x_pos(i) ) = '1' then
							spriteVgaRed<="111";				
							spriteVgaGreen<="101";
							spriteVgaBlue<="11";
							detected:= true;
						end if;					
					end if;					
				end if;
			end if;			
		end loop;
		
		if y>=y_pos(gubbe) and y < (y_pos(gubbe)+gubbSize) then
			if x>= x_pos(gubbe) and x < (x_pos(gubbe)+spriteSize) then
				if sprite_gubbe( y - y_pos(gubbe) )( x - x_pos(gubbe) ) = '1' then
					spriteVgaRed<="111";				
					spriteVgaGreen<="101";
					spriteVgaBlue<="00";
					if detected = true then
						collisionDetected := true;
					end if;
					detected:= true;
				end if;					
			end if;					
		end if;
				
		if detected = true then
			spriteDetected <= '1';
		else
			spriteDetected <= '0';
		end if;
		
		if collisionDetected = true then
			collision <='1';
			else
			collision <='0';
		end if;
		
	end if;
end process;

end Behavioral;

