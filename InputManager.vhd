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
    Port ( up_pressed : in  STD_LOGIC;
           down_pressed : in  STD_LOGIC;
           jump : out  STD_LOGIC;
           duck : out  STD_LOGIC;
           rst : out  STD_LOGIC;
           clk : in  STD_LOGIC);
end InputManager;

architecture Behavioral of InputManager is
signal button_pressed : STD_LOGIC:='0';
signal counter1024 :  STD_LOGIC_VECTOR (9 downto 0):="0000000000";
begin

process(clk)
begin

if rising_edge(clk) then
	if button_pressed ='1' then
		counter1024 <= counter1024 + 1;
		if counter1024 = "1111111111" then
			button_pressed<='0';
			jump<='0';
			rst<='0';
			duck<='0';
		end if;
	else
		if up_pressed ='1' and down_pressed='1' then
			rst<='1';
			button_pressed<='1';
			counter1024<="0000000000";
		elsif up_pressed ='1' then
			button_pressed<='1';
			jump<='1';
			counter1024<="0000000000";
		elsif down_pressed='1' then			
			button_pressed<='1';
			duck<='1';			
			counter1024<="0000000000";
		end if;
	end if;
end if;
end process;
end Behavioral;

