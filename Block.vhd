----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:15:19 04/23/2012 
-- Design Name: 
-- Module Name:    BlockHan - Behavioral 
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

entity Blocky is
    Port ( clk : in  STD_LOGIC;
           uppner : in  STD_LOGIC_VECTOR (9 downto 0);
           place : out  STD_LOGIC);
end Blocky;

architecture Behavioral of Blocky is

begin

process(clk)
variable i : integer := 0;

begin

if rising_edge(clk) then
	if i <= 9 then
		place <= uppner(i);
		i := i+1;
	else
		i := 0;
	end if;
end if;

end process;
end Behavioral;

