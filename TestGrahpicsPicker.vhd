--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:26:22 04/18/2012
-- Design Name:   
-- Module Name:   C:/Documents and Settings/ricwi433/InputManager/TestGrahpicsPicker.vhd
-- Project Name:  InputManager
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: GraphicsPicker
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 USE ieee.numeric_std.ALL;
 
ENTITY TestGrahpicsPicker IS
END TestGrahpicsPicker;
 
ARCHITECTURE behavior OF TestGrahpicsPicker IS 
 
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
    

   --Inputs
   signal clk : std_logic := '0';
   signal tile : std_logic_vector(7 downto 0) := (others => '1');
   signal sprite : std_logic_vector(7 downto 0) := (others => '0');
   signal y : 	integer range 0 to 520 := 0 ;
   signal x :  integer range 0 to 800 := 0 ;

 	--Outputs
   signal graphics : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: GraphicsPicker PORT MAP (
          clk => clk,
          tile => tile,
          sprite => sprite,
          x => x,
          y => y,
          graphics => graphics
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		y<=300;
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
