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

entity BlockHan is
    Port ( clk : in  STD_LOGIC;
           send : out  STD_LOGIC);
end BlockHan;

architecture Behavioral of BlockHan is

	COMPONENT RandomGen
    PORT(
         clk : IN  std_logic;
         uppner : OUT	std_logic_vector(9 downto 0)
        );
   END COMPONENT;
	 
	COMPONENT Blocky
    PORT(
         clk : IN  std_logic;
         uppner : IN	std_logic_vector(9 downto 0);
			place : INOUT std_logic
        );
   END COMPONENT;

	signal uppner : std_logic_vector(9 downto 0) := "0000000000";
	signal place : std_logic := '0';
begin

rnd: RandomGen PORT MAP (
		 clk => clk,
		 uppner=>uppner
	  );
	  
blo: Blocky PORT MAP (
		 clk => clk,
		 uppner=>uppner,
		 place => place
	  );

process(clk)
variable i : integer;

begin

if rising_edge(clk) then
	send <= place;
end if;

end process;
end Behavioral;

