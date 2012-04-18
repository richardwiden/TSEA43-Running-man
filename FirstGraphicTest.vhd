----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:21:25 04/18/2012 
-- Design Name: 
-- Module Name:    FirstGraphicTest - Behavioral 
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

entity FirstGraphicTest is
    PORT(
         clk : IN  std_logic   ;   
			vsync : OUT  std_logic;
         hsync : OUT  std_logic
        );
end FirstGraphicTest;

architecture Behavioral of FirstGraphicTest is
    -- Component Declaration for the Unit Under Test (UUT)
	
    COMPONENT GraphicsPicker
    PORT(
         clk : IN  std_logic;
         tile : IN  std_logic_vector(7 downto 0);
         sprite : IN  std_logic_vector(7 downto 0);
         y : in integer range 0 to 520;
         x : in integer range 0 to 800;
         graphics : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
	 COMPONENT sraknare
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         vsynk : OUT  std_logic;
         hsynk : OUT  std_logic;
         y : inout  integer range 0 to 520;
			x : inout  integer range 0 to 800
        );
    END COMPONENT;

   --Inputs   
   signal tile : std_logic_vector(7 downto 0) := (others => '1');
   signal sprite : std_logic_vector(7 downto 0) := (others => '0');
   signal y : 	integer range 0 to 520 := 0 ;
   signal x :  integer range 0 to 800 := 0 ;

 	--Outputs
   signal graphics : std_logic_vector(7 downto 0);


	--signal clk : std_logic := '0';
	signal rst : std_logic := '0';
	
	-- Clock period definitions
   constant clk_period : time := 1 ns;
begin
	picker: GraphicsPicker PORT MAP (
          clk => clk,
          tile => tile,
          sprite => sprite,
          x => x,
          y => y,
          graphics => graphics
        );
		  
	raknare: sraknare PORT MAP (
          clk => clk,
          rst => rst,
          vsynk => vsync,
          hsynk => hsync,
          x => x,
          y => y
        );		

  --clk_process :process
   --begin
		--clk <= '0';
		--wait for clk_period/2;
		--clk <= '1';
		--wait for clk_period/2;
   --end process;		  
end Behavioral;

