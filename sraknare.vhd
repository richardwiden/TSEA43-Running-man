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
			hw_rst : in  STD_LOGIC;
			vsynk : out  STD_LOGIC;
			hsynk : out  STD_LOGIC;			
			y : inout  std_logic_vector (10 downto 0);
			x : inout  std_logic_vector (10 downto 0)
		);
	end sraknare;
	architecture Behavioral of sraknare is
	signal TEMP: STD_LOGIC_VECTOR (9 downto 0);
	signal counter: integer range 0 to 3;
	begin
	process(clk)
	begin
if rising_edge(clk) then
if hw_rst = '1' then
	vsynk<='0';
	hsynk<='0';
	x<="00000000000";
	y<="00000000000";
	counter<= 0;
else

	if counter = 0 then
		counter <= 1;
	elsif	counter = 1 then
		counter <= 2;
	elsif counter = 2 then
		counter <= 3;
	else
		counter <= 0;	 
		if x="01100011111" then  --799
			x<="00000000000";  --0
			if y="01000001000" then --520
				y<="00000000000";  --0
			else
				y<=y + 1;
			end if;
		else
			x<=x + 1;
		end if;
		if x>="01010001111" and x<= "01011101111" then -- >= 655 och <=751
			hsynk<='1';
		else
			hsynk<='0';
		end if;
		if y>="00111101001" and y<="00111101011" then -- ==489 mellan ==491
			vsynk<='1';
		else
			vsynk<='0';
		end if;
	end if;
end if;
end if;
end process;
end Behavioral;