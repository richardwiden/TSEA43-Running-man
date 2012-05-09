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
				btnl: in std_logic;
           jump : out  STD_LOGIC;
           duck : out  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  game_rst: out std_logic);
end InputManager;

architecture Behavioral of InputManager is
signal hinder_action : std_logic;
signal counter1024 :  STD_LOGIC_VECTOR (31 downto 0);
begin

process(clk)
begin

if rising_edge(clk) then
	if rst = '1' then
		hinder_action <= '0';
		counter1024 <="00000000000000000000000000000000";
		jump <='0';
		duck <='0';	
		game_rst	<= '0';
	else
		if btnl = '1' then --Reset
			game_rst <='1';		
		elsif hinder_action = '1' and counter1024 = "00000011000000000000000000000000" then --Vi ska nu börja ta emot signaler igen.
			hinder_action <= '0';
			counter1024 <= "00000000000000000000000000000000";
		elsif hinder_action = '0' and btnu = '1' and counter1024 ="00000000000000000000000000000000" then --Skickar iväg jump.
			jump <='1';
			counter1024 <=counter1024+1;			
		elsif hinder_action = '0' and btnd='1' and counter1024 ="00000000000000000000000000000000" then --Skickar iväg duck.
			duck <= '1';
			counter1024 <=counter1024+1;
		else
			if counter1024 = "00001000000000000000000000000000" then --Man ska landa eller ställa sig upp här.
				jump <='0';
				duck <='0';
				hinder_action <= '1'; --Säger att man inte kan göra nåt.
				counter1024 <= "00000000000000000000000000000001";
			elsif counter1024 = "00000000000000000000000000000000" then --Om counter1024=0 ska vi inte göra nåt.
				counter1024 <=counter1024;
			else --Annars räkna upp.
				counter1024 <= counter1024+1;
			end if;
		end if;
	end if;
end if;
end process;
end Behavioral;

