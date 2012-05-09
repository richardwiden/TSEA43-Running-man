----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:	16:06:57 04/20/2012
-- Design Name:
-- Module Name:	frameCounter - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity frameCounter is
	Port ( 
		clk : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		score : inout  STD_LOGIC_VECTOR (31 downto 0);
		frame : out  STD_LOGIC;
		put_block : out std_logic;
		game_frozen: in std_logic;
		split_legs: out std_logic
	);
end frameCounter;
architecture Behavioral of frameCounter is
	signal counter_speed : STD_LOGIC_VECTOR (31 downto 0);
	signal counter_frame : STD_LOGIC_VECTOR (31 downto 0);
	signal time_counter : STD_LOGIC_VECTOR (31 downto 0);
	signal time_counter2 : STD_LOGIC_VECTOR (3 downto 0);
	signal speed : STD_LOGIC_VECTOR (31 downto 0);
	begin
	process(clk)
	begin
		if rising_edge(clk) then
			if(rst='1') then
				score <= "00000000000000000000000000000000"; --0
				frame <= '0';
				counter_speed <= "00000000000000000000000000000000";
				counter_frame <= "00000000000000000000000000000000";
				speed <= "00000000000010000000000000000000"; --524288 (Högre tal -> lägre hastighet)
				put_block <= '0';
				time_counter2 <= "0011"; --3
				time_counter <= "00000010000000000000000000000000"; --33554432
				split_legs <= '0';
			elsif game_frozen = '1' then --Om vi har krockat är game_frozen=1 och vi ska inte göra nåt.
			else
				counter_frame<=counter_frame + 1;	
				time_counter2 <= time_counter2 -1;
				if time_counter2 = "0000" then --Var 4:e clockpuls ska vi räkna ner time_counter.
					time_counter2 <= "0011";
					time_counter <= time_counter -1;
					if time_counter = "00000000000000000000000000000000" then --Nu ska vi skicka block.
						time_counter <= "00000100000000000000000000000000"; --67108864
						put_block <='1';						
					end if;
				else
					put_block <='0';
				end if;

				if counter_frame = speed  then --Speed minskar då och då och därför kommer vi in i satsen öftare ju längre vi har kört.
					counter_frame<="00000000000000000000000000000000";
					frame<='1'; --Nu ska vi rita ut. (FPS ökar ju längre vi kommer)
					if counter_speed = "00000000000000000000010000000000" then --Ökar hastigheten vid 1024
						if speed >  "00000000000000001000000000000000" then --Hastighetsstopp vid 32768
							speed <= speed - "00000000000000000100000000000000"; --16384
						end if;
						counter_speed <="00000000000000000000000000000000";
					else
						counter_speed<=counter_speed+1;		
						split_legs <= counter_speed(6);
					end if;
				else
					frame<='0';
				end if;
			end if;
		end if;
	end process;
end Behavioral;