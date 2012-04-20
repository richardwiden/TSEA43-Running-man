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
         hsync : OUT  std_logic;
			vgaRed: OUT  std_logic_vector(2 downto 0);					
			vgaGreen: OUT  std_logic_vector(2 downto 0);		
			vgaBlue: OUT  std_logic_vector(2 downto 1)		
        );
end FirstGraphicTest;



architecture Behavioral of FirstGraphicTest is
    -- Component Declaration for the Unit Under Test (UUT)
	
    COMPONENT GraphicsPicker
    PORT(
         clk : IN  std_logic;
         tileVgaRed: in  std_logic_vector(2 downto 0);					
			tileVgaGreen: in  std_logic_vector(2 downto 0);		
			tileVgaBlue: in  std_logic_vector(2 downto 1);
			spriteVgaRed: in  std_logic_vector(2 downto 0);					
			spriteVgaGreen: in  std_logic_vector(2 downto 0);		
			spriteVgaBlue: in  std_logic_vector(2 downto 1);
         y : in integer range 0 to 521;
         x : in integer range 0 to 800;
         vgaRed: OUT  std_logic_vector(2 downto 0);					
			vgaGreen: OUT  std_logic_vector(2 downto 0);		
			vgaBlue: OUT  std_logic_vector(2 downto 1)
        );
    END COMPONENT;
    
	 COMPONENT sraknare
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         vsynk : OUT  std_logic;
         hsynk : OUT  std_logic;
         y : inout  integer range 0 to 521;
			x : inout  integer range 0 to 800
        );
    END COMPONENT;

   --Inputs   
   
	
	signal tileVgaRed:		std_logic_vector(2 downto 0) := (others => '1');				
	signal tileVgaGreen:		std_logic_vector(2 downto 0) := (others => '0');	
	signal tileVgaBlue:		std_logic_vector(2 downto 1) := (others => '1');
	
	signal spriteVgaRed:		std_logic_vector(2 downto 0) := (others => '0');				
	signal spriteVgaGreen:	std_logic_vector(2 downto 0) := (others => '1');	
	signal spriteVgaBlue:	std_logic_vector(2 downto 1) := (others => '0');
	   
   signal y : 	integer range 0 to 521 := 0 ;
   signal x :  integer range 0 to 800 := 0 ;



	--signal clk : std_logic := '0';
	signal rst : std_logic := '1';
	
	-- Clock period definitions
   constant clk_period : time := 1 ns;
	signal resetcounter : integer range 0 to 20 :=0;
begin
	picker: GraphicsPicker PORT MAP (
				clk => clk,
				tileVgaRed => tileVgaRed,					
				tileVgaGreen =>tileVgaGreen,
				tileVgaBlue => tileVgaBlue,
				spriteVgaRed => spriteVgaRed,					
				spriteVgaGreen =>spriteVgaGreen,
				spriteVgaBlue => spriteVgaBlue,
				x => x,
				y => y,
				vgaRed => vgaRed,					
				vgaGreen =>vgaGreen,
				vgaBlue => vgaBlue
        );
		  
	raknare: sraknare PORT MAP (
          clk => clk,
          rst => rst,
          vsynk => vsync,
          hsynk => hsync,
          x => x,
          y => y
        );		

  clk_process :process
  
   begin
		if rst = '1' and resetcounter = 19 then
			rst<= '0';
		elsif resetcounter =19 then
			resetcounter <=19;
		else
			resetcounter <= resetcounter +1;			
		end if;
   end process;		  
end Behavioral;

