--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:50:20 04/16/2012
-- Design Name:   
-- Module Name:   C:/Documents and Settings/ricwi433/InputManager/TestInput.vhd
-- Project Name:  InputManager
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: InputManager
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
 
ENTITY TestInput IS
END TestInput;
 
ARCHITECTURE behavior OF TestInput IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InputManager
    PORT(
         up_pressed : IN  std_logic;
         down_pressed : IN  std_logic;
         jump : OUT  std_logic;
         duck : OUT  std_logic;
         rst : OUT  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal up_pressed : std_logic := '0';
   signal down_pressed : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal jump : std_logic;
   signal duck : std_logic;
   signal rst : std_logic;

   -- Clock period definitions
   constant clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InputManager PORT MAP (
          up_pressed => up_pressed,
          down_pressed => down_pressed,
          jump => jump,
          duck => duck,
          rst => rst,
          clk => clk
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
		
		up_pressed <='1';
      wait for clk_period*10;
		up_pressed <='0';
		wait for 1500 ns;
		
		down_pressed <='1';
      wait for clk_period*10;
		down_pressed <='0';
		wait for 1500 ns;
	
		down_pressed <='1';
		up_pressed <='1';
      wait for clk_period*10;
		down_pressed <='0';
		up_pressed <='0';
		wait for 1500 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
