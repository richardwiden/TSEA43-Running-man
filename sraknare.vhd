----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:	14:22:05 04/16/2012
-- Design Name:
-- Module Name:	sraknare - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity sraknare is
	Port (  clk : in  STD_LOGIC;
    rst : in  STD_LOGIC;
	vsynk : out  STD_LOGIC;
	hsynk : out  STD_LOGIC;
	y : inout  integer range 0 to 520;
	x : inout  integer range 0 to 800);
end sraknare;
architecture Behavioral of sraknare is
signal TEMP: STD_LOGIC_VECTOR (9 downto 0);
begin
process(clk)
begin
if rising_edge(clk) then
 if rst='1' then
  vsynk<='0';
  hsynk<='0';
  x<=0;
  y<=0;
 else

 if x=800 then  --800
  x<=0;  --0
  if y=520 then --521
   y<=0;  --0
  else
   y<=y + 1;
  end if;
 else
  x<=x + 1;
 end if;
 
  if x>=656 and x<= 752 then -- >= 656 och <=752
   hsynk<='1';
  else
   hsynk<='0';
  end if;
  
  if y>=490 and y<=491 then -- ==490  eller ==491
   vsynk<='1';
  else
   vsynk<='0';
  end if;
 end if;
end if;

end process;
end Behavioral;