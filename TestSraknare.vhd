--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:30:20 04/18/2012
-- Design Name:   
-- Module Name:   I:/portablegit/TSEA43-Running-man/TestSraknare.vhd
-- Project Name:  TestProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sraknare
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
--USE ieee.numeric_std.ALL;
 
ENTITY TestSraknare IS
END TestSraknare;
 
ARCHITECTURE behavior OF TestSraknare IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sraknare
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         vsynk : OUT  std_logic;
         hsynk : OUT  std_logic;
         x : inout  integer range 0 to 520;
			y : inout  integer range 0 to 800
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

	--BiDirs
   signal x : 	integer range 0 to 520 := 0 ;
   signal y :  integer range 0 to 800 := 0 ;

 	--Outputs
   signal vsynk : std_logic;
   signal hsynk : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sraknare PORT MAP (
          clk => clk,
          rst => rst,
          vsynk => vsynk,
          hsynk => hsynk,
          x => x,
          y => y
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

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
