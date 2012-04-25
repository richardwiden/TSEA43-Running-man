----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:16:30 04/16/2012 
-- Design Name: 
-- Module Name:    InputManager - Behavioral 
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

entity InputManager is
    Port ( 	btnd: in std_logic;
				btnu: in std_logic;
           jump : out  STD_LOGIC;
           duck : out  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC);
end InputManager;

architecture Behavioral of InputManager is
signal button_pressed : STD_LOGIC:='0';
signal counter1024 :  STD_LOGIC_VECTOR (9 downto 0):="0000000000";
begin

process(clk)
begin

if rising_edge(clk) then
		if btnu = '1' and counter1024 ="0000000000" then
			jump <='1';
			counter1024 <=counter1024+1;			
		elsif btnd='1' and counter1024 ="0000000000" then
			duck <= '1';
			counter1024 <=counter1024+1;
		else
			if counter1024 = "1111111111" then
				jump <='0';
				duck <='0';
				counter1024 <= "0000000000";
			elsif counter1024 = "0000000000" then
				counter1024 <=counter1024;
			else			
				counter1024 <= counter1024+1;
			end if;
		end if;
	
end if;
end process;
end Behavioral;

