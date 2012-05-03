----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:03:27 04/23/2012 
-- Design Name: 
-- Module Name:    TileGpu - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TileGpu is
    Port ( 	clk : in  STD_LOGIC;
				x : in  integer;
				y : in  integer;
				tileVgaRed: out  std_logic_vector(2 downto 0);					
				tileVgaGreen: out  std_logic_vector(2 downto 0);		
				tileVgaBlue: out  std_logic_vector(2 downto 1);	
				rst : in  STD_LOGIC;
				count_up : in std_logic
				);
end TileGpu;


architecture Behavioral of TileGpu is
subtype heltal is integer  range 0 to 9;
type counter_type is array (0 to 3) of heltal;


subtype elements is std_logic_vector(0 to 31);
type bit_array is array (0 to 31) of elements;
type number_array is array (0 to 9) of bit_array;
signal tile_number : number_array ;
signal x_std : std_logic_vector( 9 downto 0);
signal counter: counter_type;

begin
tile_number (0)( 0)	<=	"11111111111111111111111111111111";
tile_number (0)( 1)	<=	"11111111111111111111111111111111";
tile_number (0)( 2)	<=	"11111111111111111111111111111111";
tile_number (0)( 3)	<=	"11111111111111111111111111111111";
tile_number (0)( 4)	<=	"11111111111000000011111111111111";
tile_number (0)( 5)	<=	"11111111111000000001111111111111";
tile_number (0)( 6)	<=	"11111111110000000000011111111111";
tile_number (0)( 7)	<=	"11111111100001111100001111111111";
tile_number (0)( 8)	<=	"11111111000001111100001111111111";
tile_number (0)( 9)	<=	"11111111100001111100000111111111";
tile_number (0)(10)	<=	"11111111000001111100000111111111";
tile_number (0)(11)	<=	"11111111000001111100000111111111";
tile_number (0)(12)	<=	"11111111000001111100000111111111";
tile_number (0)(13)	<=	"11111111000001111100000111111111";
tile_number (0)(14)	<=	"11111110000001111100000011111111";
tile_number (0)(15)	<=	"11111110000001111100000011111111";
tile_number (0)(16)	<=	"11111110000001111100000011111111";
tile_number (0)(17)	<=	"11111110000001111100000011111111";
tile_number (0)(18)	<=	"11111110000001111100000011111111";
tile_number (0)(19)	<=	"11111110000001111100000011111111";
tile_number (0)(20)	<=	"11111111000001111100000111111111";
tile_number (0)(21)	<=	"11111111000001111100000111111111";
tile_number (0)(22)	<=	"11111111000001111100000111111111";
tile_number (0)(23)	<=	"11111111000001111100000111111111";
tile_number (0)(24)	<=	"11111110000001111100000111111111";
tile_number (0)(25)	<=	"11111111000001111100001111111111";
tile_number (0)(26)	<=	"11111111100001111100001111111111";
tile_number (0)(27)	<=	"11111111110001111100001111111111";
tile_number (0)(28)	<=	"11111111111000111000001111111111";
tile_number (0)(29)	<=	"11111111111100000000011111111111";
tile_number (0)(30)	<=	"11111111111110111111111111111111";
tile_number (0)(31)	<=	"11111111111111111111111111111111";

tile_number (1)( 0)	<=	"11111111111111111111111111111111";
tile_number (1)( 1)	<=	"11111111111111111111111111111111";
tile_number (1)( 2)	<=	"11111111111111111111111111111111";
tile_number (1)( 3)	<=	"11111111111111111111111111111111";
tile_number (1)( 4)	<=	"11111111111111111111111111111111";
tile_number (1)( 5)	<=	"11111111111111111111111111111111";
tile_number (1)( 6)	<=	"11111111111111111011111111111111";
tile_number (1)( 7)	<=	"11111111111111100011111111111111";
tile_number (1)( 8)	<=	"11111111111110000011111111111111";
tile_number (1)( 9)	<=	"11111111111000000011111111111111";
tile_number (1)(10)	<=	"11111111111000000011111111111111";
tile_number (1)(11)	<=	"11111111111000000011111111111111";
tile_number (1)(12)	<=	"11111111111110000011111111111111";
tile_number (1)(13)	<=	"11111111111110000011111111111111";
tile_number (1)(14)	<=	"11111111111110000011111111111111";
tile_number (1)(15)	<=	"11111111111110000011111111111111";
tile_number (1)(16)	<=	"11111111111110000011111111111111";
tile_number (1)(17)	<=	"11111111111110000011111111111111";
tile_number (1)(18)	<=	"11111111111110000011111111111111";
tile_number (1)(19)	<=	"11111111111110000011111111111111";
tile_number (1)(20)	<=	"11111111111110000011111111111111";
tile_number (1)(21)	<=	"11111111111110000011111111111111";
tile_number (1)(22)	<=	"11111111111110000011111111111111";
tile_number (1)(23)	<=	"11111111111110000011111111111111";
tile_number (1)(24)	<=	"11111111111110000011111111111111";
tile_number (1)(25)	<=	"11111111111110000011111111111111";
tile_number (1)(26)	<=	"11111111111111111111111111111111";
tile_number (1)(27)	<=	"11111111111111111111111111111111";
tile_number (1)(28)	<=	"11111111111111111111111111111111";
tile_number (1)(29)	<=	"11111111111111111111111111111111";
tile_number (1)(30)	<=	"11111111111111111111111111111111";
tile_number (1)(31)	<=	"11111111111111111111111111111111";

tile_number (2)( 0)	<=	"11111111111111111111111111111111";
tile_number (2)( 1)	<=	"11111111111111111111111111111111";
tile_number (2)( 2)	<=	"11111111111111111111111111111111";
tile_number (2)( 3)	<=	"11111111111111111111111111111111";
tile_number (2)( 4)	<=	"11111111111111111111111111111111";
tile_number (2)( 5)	<=	"11111111111111111111111111111111";
tile_number (2)( 6)	<=	"11111111111111000011111111111111";
tile_number (2)( 7)	<=	"11111111111000000000111111111111";
tile_number (2)( 8)	<=	"11111111110000000000011111111111";
tile_number (2)( 9)	<=	"11111111100000000000001111111111";
tile_number (2)(10)	<=	"11111111101111110000001111111111";
tile_number (2)(11)	<=	"11111111011111111000000111111111";
tile_number (2)(12)	<=	"11111111111111111100000111111111";
tile_number (2)(13)	<=	"11111111111111111100001111111111";
tile_number (2)(14)	<=	"11111111111111111100001111111111";
tile_number (2)(15)	<=	"11111111111111111100001111111111";
tile_number (2)(16)	<=	"11111111111111111100011111111111";
tile_number (2)(17)	<=	"11111111111111111000111111111111";
tile_number (2)(18)	<=	"11111111111111111001111111111111";
tile_number (2)(19)	<=	"11111111111111110001111111111111";
tile_number (2)(20)	<=	"11111111111111110111111111111111";
tile_number (2)(21)	<=	"11111111111111100111111111111111";
tile_number (2)(22)	<=	"11111111111111001111111111111111";
tile_number (2)(23)	<=	"11111111111110011111111111111111";
tile_number (2)(24)	<=	"11111111111100111111111111111111";
tile_number (2)(25)	<=	"11111111111000000000000111111111";
tile_number (2)(26)	<=	"11111111110000000000000111111111";
tile_number (2)(27)	<=	"11111111110000000000000111111111";
tile_number (2)(28)	<=	"11111111000000000000000111111111";
tile_number (2)(29)	<=	"11111111000000000000000111111111";
tile_number (2)(30)	<=	"11111111111111111111111111111111";
tile_number (2)(31)	<=	"11111111111111111111111111111111";


tile_number (3)( 0)	<=	"11111111111111111111111111111111";
tile_number (3)( 1)	<=	"11111111111111111111111111111111";
tile_number (3)( 2)	<=	"11111111111111111111111111111111";
tile_number (3)( 3)	<=	"11111111111111111111111111111111";
tile_number (3)( 4)	<=	"11111111111111000011111111111111";
tile_number (3)( 5)	<=	"11111111111000000000111111111111";
tile_number (3)( 6)	<=	"11111111111000000000111111111111";
tile_number (3)( 7)	<=	"11111111100000000000011111111111";
tile_number (3)( 8)	<=	"11111111001111100000011111111111";
tile_number (3)( 9)	<=	"11111111111111111000001111111111";
tile_number (3)(10)	<=	"11111111111111111000001111111111";
tile_number (3)(11)	<=	"11111111111111111000011111111111";
tile_number (3)(12)	<=	"11111111111111111000111111111111";
tile_number (3)(13)	<=	"11111111111111111001111111111111";
tile_number (3)(14)	<=	"11111111111111110011111111111111";
tile_number (3)(15)	<=	"11111111111111000000111111111111";
tile_number (3)(16)	<=	"11111111111100000000011111111111";
tile_number (3)(17)	<=	"11111111111111000000001111111111";
tile_number (3)(18)	<=	"11111111111111110000001111111111";
tile_number (3)(19)	<=	"11111111111111111000000111111111";
tile_number (3)(20)	<=	"11111111111111111000000111111111";
tile_number (3)(21)	<=	"11111111111111111100000111111111";
tile_number (3)(22)	<=	"11111111111111111100000111111111";
tile_number (3)(23)	<=	"11111111111111111100001111111111";
tile_number (3)(24)	<=	"11111111111111111100001111111111";
tile_number (3)(25)	<=	"11111100000111111100011111111111";
tile_number (3)(26)	<=	"11111100000111111100011111111111";
tile_number (3)(27)	<=	"11111100000011111000111111111111";
tile_number (3)(28)	<=	"11111110000000000001111111111111";
tile_number (3)(29)	<=	"11111110000000000011111111111111";
tile_number (3)(30)	<=	"11111111110000111111111111111111";
tile_number (3)(31)	<=	"11111111111111111111111111111111";

tile_number (4)( 0)	<=	"11111111111111111111111111111111";
tile_number (4)( 1)	<=	"11111111111111111111111111111111";
tile_number (4)( 2)	<=	"11111111111111111111111111111111";
tile_number (4)( 3)	<=	"11111111111111111111111111111111";
tile_number (4)( 4)	<=	"11111111111111111110011111111111";
tile_number (4)( 5)	<=	"11111111111111111100011111111111";
tile_number (4)( 6)	<=	"11111111111111111000011111111111";
tile_number (4)( 7)	<=	"11111111111111110000011111111111";
tile_number (4)( 8)	<=	"11111111111111100000011111111111";
tile_number (4)( 9)	<=	"11111111111111100000011111111111";
tile_number (4)(10)	<=	"11111111111111000000011111111111";
tile_number (4)(11)	<=	"11111111111110000000011111111111";
tile_number (4)(12)	<=	"11111111111100000000011111111111";
tile_number (4)(13)	<=	"11111111111000010000011111111111";
tile_number (4)(14)	<=	"11111111110000110000011111111111";
tile_number (4)(15)	<=	"11111111100001110000011111111111";
tile_number (4)(16)	<=	"11111111000001110000011111111111";
tile_number (4)(17)	<=	"11111110100011110000011111111111";
tile_number (4)(18)	<=	"11111110000000000000000111111111";
tile_number (4)(19)	<=	"11111110000000000000000111111111";
tile_number (4)(20)	<=	"11111110000000000000000111111111";
tile_number (4)(21)	<=	"11111110000000000000000111111111";
tile_number (4)(22)	<=	"11111111111111110000011111111111";
tile_number (4)(23)	<=	"11111111111111110000011111111111";
tile_number (4)(24)	<=	"11111111111111110000011111111111";
tile_number (4)(25)	<=	"11111111111111110000011111111111";
tile_number (4)(26)	<=	"11111111111111110000011111111111";
tile_number (4)(27)	<=	"11111111111111110000011111111111";
tile_number (4)(28)	<=	"11111111111111111111111111111111";
tile_number (4)(29)	<=	"11111111111111111111111111111111";
tile_number (4)(30)	<=	"11111111111111111111111111111111";
tile_number (4)(31)	<=	"11111111111111111111111111111111";


tile_number (5)( 0)	<=	"11111111111111111111111111111111";
tile_number (5)( 1)	<=	"11111111111111111111111111111111";
tile_number (5)( 2)	<=	"11111111111111111111111111111111";
tile_number (5)( 3)	<=	"11111111111111111111111111111111";
tile_number (5)( 4)	<=	"11111111111111111111111111111111";
tile_number (5)( 5)	<=	"11111111111100000000001111111111";
tile_number (5)( 6)	<=	"11111111111100000000001111111111";
tile_number (5)( 7)	<=	"11111111111000000000001111111111";
tile_number (5)( 8)	<=	"11111111111000000000011111111111";
tile_number (5)( 9)	<=	"11111111110000000000011111111111";
tile_number (5)(10)	<=	"11111111110000011111111111111111";
tile_number (5)(11)	<=	"11111111110100011111111111111111";
tile_number (5)(12)	<=	"11111111100001011111111111111111";
tile_number (5)(13)	<=	"11111111100000000111111111111111";
tile_number (5)(14)	<=	"11111111000000000001111111111111";
tile_number (5)(15)	<=	"11111111000000000000111111111111";
tile_number (5)(16)	<=	"11111110000000000000011111111111";
tile_number (5)(17)	<=	"11111111111111000000001111111111";
tile_number (5)(18)	<=	"11111111111111000000001111111111";
tile_number (5)(19)	<=	"11111111111111111000001111111111";
tile_number (5)(20)	<=	"11111111111111111100000111111111";
tile_number (5)(21)	<=	"11111111111111111111000111111111";
tile_number (5)(22)	<=	"11111111111111111111000111111111";
tile_number (5)(23)	<=	"11111111111111111110100111111111";
tile_number (5)(24)	<=	"11111111111111111110000111111111";
tile_number (5)(25)	<=	"11111111111111111110001111111111";
tile_number (5)(26)	<=	"11111111001111111110001111111111";
tile_number (5)(27)	<=	"11111110000011111100101111111111";
tile_number (5)(28)	<=	"11111110000001111101001111111111";
tile_number (5)(29)	<=	"11111111000000010000011111111111";
tile_number (5)(30)	<=	"11111111111000000000111111111111";
tile_number (5)(31)	<=	"11111111111111111111111111111111";


tile_number (6)( 0)	<=	"11111111111111111111111111111111";
tile_number (6)( 1)	<=	"11111111111111111111111111111111";
tile_number (6)( 2)	<=	"11111111111111111111111111111111";
tile_number (6)( 3)	<=	"11111111111111111111111111111111";
tile_number (6)( 4)	<=	"11111111111111111111111111111111";
tile_number (6)( 5)	<=	"11111111111111111111111111111111";
tile_number (6)( 6)	<=	"11111111111111111111100011111111";
tile_number (6)( 7)	<=	"11111111111111100001111111111111";
tile_number (6)( 8)	<=	"11111111111111000011111111111111";
tile_number (6)( 9)	<=	"11111111111110000111111111111111";
tile_number (6)(10)	<=	"11111111111100001111111111111111";
tile_number (6)(11)	<=	"11111111111000011111111111111111";
tile_number (6)(12)	<=	"11111111110000011111111111111111";
tile_number (6)(13)	<=	"11111111110000011111111111111111";
tile_number (6)(14)	<=	"11111111100000111111111111111111";
tile_number (6)(15)	<=	"11111111100000110001111111111111";
tile_number (6)(16)	<=	"11111111100000111100001111111111";
tile_number (6)(17)	<=	"11111111100001111100001111111111";
tile_number (6)(18)	<=	"11111111000001111110000111111111";
tile_number (6)(19)	<=	"11111111000001111110000111111111";
tile_number (6)(20)	<=	"11111111000001111110000011111111";
tile_number (6)(21)	<=	"11111111000001111110000011111111";
tile_number (6)(22)	<=	"11111111000001111110000011111111";
tile_number (6)(23)	<=	"11111111100001111110000011111111";
tile_number (6)(24)	<=	"11111111100001111110000111111111";
tile_number (6)(25)	<=	"11111111110001111110000111111111";
tile_number (6)(26)	<=	"11111111110000111110001111111111";
tile_number (6)(27)	<=	"11111111111000111110001111111111";
tile_number (6)(28)	<=	"11111111111100011100011111111111";
tile_number (6)(29)	<=	"11111111111111000011111111111111";
tile_number (6)(30)	<=	"11111111111111111111111111111111";
tile_number (6)(31)	<=	"11111111111111111111111111111111";


tile_number (7)( 0)	<=	"11111111111111111111111111111111";
tile_number (7)( 1)	<=	"11111111111111111111111111111111";
tile_number (7)( 2)	<=	"11111111111111111111111111111111";
tile_number (7)( 3)	<=	"11111111111111111111111111111111";
tile_number (7)( 4)	<=	"11111111111111111111111111111111";
tile_number (7)( 5)	<=	"11111111111111111111111111111111";
tile_number (7)( 6)	<=	"11111111110000000000000011111111";
tile_number (7)( 7)	<=	"11111111110000000000000111111111";
tile_number (7)( 8)	<=	"11111111100000000000000111111111";
tile_number (7)( 9)	<=	"11111111100000000000000111111111";
tile_number (7)(10)	<=	"11111111100111111110000111111111";
tile_number (7)(11)	<=	"11111111111111111110000111111111";
tile_number (7)(12)	<=	"11111111111111111110000111111111";
tile_number (7)(13)	<=	"11111111111111111110001111111111";
tile_number (7)(14)	<=	"11111111111111111100001111111111";
tile_number (7)(15)	<=	"11111111111111111100001111111111";
tile_number (7)(16)	<=	"11111111111111111100001111111111";
tile_number (7)(17)	<=	"11111111111111111000001111111111";
tile_number (7)(18)	<=	"11111111111111111000011111111111";
tile_number (7)(19)	<=	"11111111111111111000011111111111";
tile_number (7)(20)	<=	"11111111111111111000011111111111";
tile_number (7)(21)	<=	"11111111111111110000011111111111";
tile_number (7)(22)	<=	"11111111111111110000011111111111";
tile_number (7)(23)	<=	"11111111111111110000011111111111";
tile_number (7)(24)	<=	"11111111111111110000111111111111";
tile_number (7)(25)	<=	"11111111111111100000111111111111";
tile_number (7)(26)	<=	"11111111111111100000111111111111";
tile_number (7)(27)	<=	"11111111111111100000111111111111";
tile_number (7)(28)	<=	"11111111111111000000111111111111";
tile_number (7)(29)	<=	"11111111111111011011111111111111";
tile_number (7)(30)	<=	"11111111111111111111111111111111";
tile_number (7)(31)	<=	"11111111111111111111111111111111";


tile_number (8)( 0)	<=	"11111111111111111111111111111111";
tile_number (8)( 1)	<=	"11111111111111111111111111111111";
tile_number (8)( 2)	<=	"11111111111111111111111111111111";
tile_number (8)( 3)	<=	"11111111111111111111111111111111";
tile_number (8)( 4)	<=	"11111111111111111111111111111111";
tile_number (8)( 5)	<=	"11111111111111111111111111111111";
tile_number (8)( 6)	<=	"11111111111100001111111111111111";
tile_number (8)( 7)	<=	"11111110000000000000111111111111";
tile_number (8)( 8)	<=	"11111111000111011000111111111111";
tile_number (8)( 9)	<=	"11111110000111111100011111111111";
tile_number (8)(10)	<=	"11111100000111111100001111111111";
tile_number (8)(11)	<=	"11111100000111111100001111111111";
tile_number (8)(12)	<=	"11111100000011111100001111111111";
tile_number (8)(13)	<=	"11111110000001111000011111111111";
tile_number (8)(14)	<=	"11111110000000011000111111111111";
tile_number (8)(15)	<=	"11111111000000000011111111111111";
tile_number (8)(16)	<=	"11111111110000000011111111111111";
tile_number (8)(17)	<=	"11111111111000000001111111111111";
tile_number (8)(18)	<=	"11111111110010000000111111111111";
tile_number (8)(19)	<=	"11111111000111000000011111111111";
tile_number (8)(20)	<=	"11111110001111100000011111111111";
tile_number (8)(21)	<=	"11111110001111110000001111111111";
tile_number (8)(22)	<=	"11111100001111111000001111111111";
tile_number (8)(23)	<=	"11111100001111111000001111111111";
tile_number (8)(24)	<=	"11111110001111111000011111111111";
tile_number (8)(25)	<=	"11111110001111111000011111111111";
tile_number (8)(26)	<=	"11111110001111111000011111111111";
tile_number (8)(27)	<=	"11111111000000001000111111111111";
tile_number (8)(28)	<=	"11111111000000000111111111111111";
tile_number (8)(29)	<=	"11111111111111111111111111111111";
tile_number (8)(30)	<=	"11111111111111111111111111111111";
tile_number (8)(31)	<=	"11111111111111111111111111111111";


tile_number (9)( 0)	<=	"11111111111111111111111111111111";
tile_number (9)( 1)	<=	"11111111111111111111111111111111";
tile_number (9)( 2)	<=	"11111111111111111111111111111111";
tile_number (9)( 3)	<=	"11111111111111111111111111111111";
tile_number (9)( 4)	<=	"11111111111111111111111111111111";
tile_number (9)( 5)	<=	"11111111100000001111111111111111";
tile_number (9)( 6)	<=	"11111111110000000000111111111111";
tile_number (9)( 7)	<=	"11111111100011111000111111111111";
tile_number (9)( 8)	<=	"11111111000011111100011111111111";
tile_number (9)( 9)	<=	"11111111000011111100001111111111";
tile_number (9)(10)	<=	"11111111000011111100001111111111";
tile_number (9)(11)	<=	"11111110000011111100001111111111";
tile_number (9)(12)	<=	"11111110000011111100000111111111";
tile_number (9)(13)	<=	"11111110000011111100000111111111";
tile_number (9)(14)	<=	"11111111000011111100000111111111";
tile_number (9)(15)	<=	"11111111000011111100000111111111";
tile_number (9)(16)	<=	"11111111000011111100000111111111";
tile_number (9)(17)	<=	"11111111110000111100001111111111";
tile_number (9)(18)	<=	"11111111111100001100001111111111";
tile_number (9)(19)	<=	"11111111111111111100001111111111";
tile_number (9)(20)	<=	"11111111111111111000011111111111";
tile_number (9)(21)	<=	"11111111111111111000011111111111";
tile_number (9)(22)	<=	"11111111111111110000111111111111";
tile_number (9)(23)	<=	"11111111111111110000011111111111";
tile_number (9)(24)	<=	"11111111111111100000111111111111";
tile_number (9)(25)	<=	"11111111111110000011111111111111";
tile_number (9)(26)	<=	"11111111111000001111111111111111";
tile_number (9)(27)	<=	"11111111000001111111111111111111";
tile_number (9)(28)	<=	"11111110000111111111111111111111";
tile_number (9)(29)	<=	"11111111111111111111111111111111";
tile_number (9)(30)	<=	"11111111111111111111111111111111";
tile_number (9)(31)	<=	"11111111111111111111111111111111";


process(clk)
variable paint : boolean;
begin
	if rising_edge(clk) then		
		if rst = '1' then
			counter(0) <= 0;
			counter(1) <= 0;
			counter(2) <= 0;
			counter(3) <= 0;
		else			
			if count_up ='1' then
				if counter(3) = 9 then
					counter(3) <= 0;
					if counter(2) = 9 then
						counter(2) <= 0;
						if counter(1) = 9 then
							counter(1) <= 0;
							if counter(0) = 9 then
								counter(0) <= 0;											
							else
								counter(0) <= counter(0) +1;
							end if;
						else
							counter(1) <= counter(1) +1;
						end if;
					else
						counter(2) <= counter(2) +1;
					end if;
				else
					counter(3) <= counter(3) +1;
				end if;
			end if;	
			
			
			-- M�ste vara integers d� indexes i arrays m�ste vara integers
			
			if y >= 0 and y < 32 and x < 128 and x >= 0 and tile_number(counter(x/32))(y)(x mod 32) = '0' then
				tileVgaRed <= "100";
				tileVgaGreen <= "100";
				tileVgaBlue <= "10";
			else
				tileVgaRed <= "000";
				tileVgaGreen <= "000";
				tileVgaBlue <= "00";
			end if;
			
		end if;
	end if;
end process;

end Behavioral;

