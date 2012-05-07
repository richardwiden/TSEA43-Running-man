----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:36 04/23/2012 
-- Design Name: 
-- Module Name:    RandomGen - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RandomGen is
    Port ( clk : in  STD_LOGIC;
           uppner : out  STD_LOGIC_VECTOR (9 downto 0)
			 );
end RandomGen;

architecture Behavioral of RandomGen is

begin
process(clk)
constant v0 : STD_LOGIC_VECTOR (0 to 9) := "1011011000";
constant v1 : STD_LOGIC_VECTOR (0 to 9) := "0101100110";
constant v2 : STD_LOGIC_VECTOR (0 to 9) := "1010110100";
constant v3 : STD_LOGIC_VECTOR (0 to 9) := "0010100111";
constant v4 : STD_LOGIC_VECTOR (0 to 9) := "1100101010";
constant v5 : STD_LOGIC_VECTOR (0 to 9) := "0100011011";
constant v6 : STD_LOGIC_VECTOR (0 to 9) := "0101101001";
constant v7 : STD_LOGIC_VECTOR (0 to 9) := "0100101011";
variable u : integer := 0;
begin

if rising_edge(clk) then
	if u = 0 and rising_edge(clk) then
		uppner <= v0;
		u := u+1;
	elsif u = 1 and rising_edge(clk) then
		uppner <= v1;
		u := u+1;
	elsif u = 2 and rising_edge(clk) then
		uppner <= v2;
		u := u+1;
	elsif u = 3 and rising_edge(clk) then
		uppner <= v3;
		u := u+1;
	elsif u = 4 and rising_edge(clk) then
		uppner <= v4;
		u := u+1;
	elsif u = 5 and rising_edge(clk) then
		uppner <= v5;
		u := u+1;
	elsif u = 6 and rising_edge(clk) then
		uppner <= v6;
		u := u+1;
	elsif u = 7 and rising_edge(clk) then
		uppner <= v7;
		u := 0;
	end if;
end if;
		

end process;
end Behavioral;

