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
			vgaBlue: OUT  std_logic_vector(2 downto 1);
			btnd: in std_logic;
			btnu: in std_logic;
			btnl: in std_logic
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
			y : in integer range 0 to 520;
			x : in integer range 0 to 799;
			vgaRed: OUT  std_logic_vector(2 downto 0);					
			vgaGreen: OUT  std_logic_vector(2 downto 0);		
			vgaBlue: OUT  std_logic_vector(2 downto 1);
			spriteDetected : in std_logic			
		);
	END COMPONENT;

	COMPONENT sraknare
		PORT(
			clk : IN  std_logic;
			hw_rst : IN  std_logic;
			vsynk : OUT  std_logic;
			hsynk : OUT  std_logic;
			y : inout  integer range 0 to 520;
			x : inout  integer range 0 to 799
		);
	END COMPONENT;

	COMPONENT SpriteGpu
		PORT( 	clk : in  STD_LOGIC;
			x : in  integer;
			y : in  integer;
			spriteVgaRed: out  std_logic_vector(2 downto 0);					
			spriteVgaGreen: out  std_logic_vector(2 downto 0);		
			spriteVgaBlue: out  std_logic_vector(2 downto 1);
			collision: out std_logic;
			rst : in  STD_LOGIC;
			spriteDetected : out std_logic;
			jump: in std_logic;
			duck: in std_logic;
			move_box: in std_logic;
			put_box: in std_logic;
			next_box: in std_logic;
			split_legs: in std_logic
		);
	END COMPONENT;

	COMPONENT InputManager
		PORT(
			btnd: in std_logic;
			btnu: in std_logic;
			btnl: in std_logic;
			jump : OUT  std_logic;
			duck : OUT  std_logic;
			rst : in  std_logic;
			clk : IN  std_logic;
			game_rst : out std_logic
		);
	END COMPONENT;

	COMPONENT frameCounter
		PORT(
			clk : IN  std_logic;
			rst : IN  std_logic;
			score : INOUT  std_logic_vector(31 downto 0);
			frame : OUT  std_logic;
			put_block : out std_logic;
			game_frozen: in std_logic;
			split_legs: out std_logic
		);
	END COMPONENT;
	
	COMPONENT TileGpu
		PORT(
			clk : IN  std_logic;
			x : IN  integer;
			y : IN  integer;
			tileVgaRed : OUT  std_logic_vector(2 downto 0);
			tileVgaGreen : OUT  std_logic_vector(2 downto 0);
			tileVgaBlue : OUT  std_logic_vector(2 downto 1);
			rst : IN  std_logic;
			count_up : in std_logic
		);
	END COMPONENT;
	
	COMPONENT BlockHan
		PORT(
			clk : IN  std_logic;
			send : OUT  std_logic
		);
	END COMPONENT;

   --Inputs   
   
	
	signal tileVgaRed:		std_logic_vector(2 downto 0);
	signal tileVgaGreen:		std_logic_vector(2 downto 0);
	signal tileVgaBlue:		std_logic_vector(2 downto 1);
	
	signal spriteVgaRed:		std_logic_vector(2 downto 0);				
	signal spriteVgaGreen:	std_logic_vector(2 downto 0);	
	signal spriteVgaBlue:	std_logic_vector(2 downto 1);
	   
   signal y : 	integer range 0 to 520 := 0 ;
   signal x :  integer range 0 to 799 := 0 ;
	
	signal scorecounter : integer range 0 to 16;
	
	signal split_legs : std_logic;
	
	signal game_frozen: std_logic;

	signal spriteDetected : std_logic;
	
	signal jump : std_logic;
	signal duck : std_logic;
	
	signal put_box: std_logic;
	signal next_box:  std_logic;
	
	signal score : STD_LOGIC_VECTOR (31 downto 0);
	signal frame : std_logic;
	
	signal count_up : std_logic;
	
	--signal clk : std_logic := '0';
	signal rst : std_logic := '1';
	signal hw_rst : std_logic :='1';
	signal game_rst : std_logic;
	-- Clock period definitions
   constant clk_period : time := 1 ns;
	signal resetcounter : integer range 0 to 20 :=0;
	signal collision : std_logic;
begin
	picker: GraphicsPicker PORT MAP (
		clk => clk,
		tileVgaRed 		=> tileVgaRed,					
		tileVgaGreen 	=> tileVgaGreen,
		tileVgaBlue 	=> tileVgaBlue,
		spriteVgaRed 	=> spriteVgaRed,					
		spriteVgaGreen => spriteVgaGreen,
		spriteVgaBlue 	=> spriteVgaBlue,
		x => x,
		y => y,
		vgaRed => vgaRed,					
		vgaGreen =>vgaGreen,
		vgaBlue => vgaBlue,
		spriteDetected =>spriteDetected
	);

	raknare: sraknare PORT MAP (
		clk => clk,
		hw_rst => hw_rst,
		vsynk => vsync,
		hsynk => hsync,
		x => x,
		y => y
	);		
	
	gpu: SpriteGpu PORT MAP (
		clk => clk,
		rst => rst,
		x => x,
		y => y,
		spriteVgaRed	=> spriteVgaRed,					
		spriteVgaGreen	=> spriteVgaGreen,
		spriteVgaBlue	=> spriteVgaBlue,
		collision => collision,
		spriteDetected =>spriteDetected,
		jump => jump,
		duck => duck,
		move_box => frame,
		put_box => put_box,
		next_box => next_box,
		split_legs => split_legs
	);
	
	tileGpuuuu: TileGpu PORT MAP (
		clk => clk,
		x => x,
		y => y,
		tileVgaRed => tileVgaRed,
		tileVgaGreen => tileVgaGreen,
		tileVgaBlue => tileVgaBlue,
		rst => rst,
		count_up => count_up
	);

	input: InputManager PORT MAP (
		btnu => btnu,
		btnd => btnd,
		btnl => btnl,
		jump => jump,
		duck => duck,
		rst => rst,
		clk => clk,
		game_rst => game_rst
	);

	frameCounteruuu: frameCounter PORT MAP (
		clk => clk,
		rst => rst,
		score => score,
		frame => frame,
		put_block => put_box,
		game_frozen => game_frozen,
		split_legs => split_legs
	);
	
	blockhanuut: BlockHan PORT MAP (
          clk => clk,
          send => next_box
        );

process(clk)
begin
if rising_edge(clk) then		
	if hw_rst = '1' then
			hw_rst<= '0';
	elsif rst = '1' then
		game_frozen	<= '0';
		scorecounter <= 0;
		rst <= '0';
	elsif collision = '1' then
		game_frozen <= '1';	
	elsif game_rst = '1' then
		rst <= '1';
	else
		if count_up = '1' then
			count_up <= '0' ;
		end if;
		if frame = '1' then			
			scorecounter <= scorecounter +1;
			if scorecounter = 16 then
				count_up <='1';
			end if;
		end if;
	end if;		
end if;
end process;		  
end Behavioral;

