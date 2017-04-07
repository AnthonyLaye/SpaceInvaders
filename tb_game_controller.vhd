library ieee;
use ieee.std_logic_1164.all;

entity tb_game_controller is
end tb_game_controller;

architecture behaviour of tb_game_controller is

	component game_controller is
		port(

       		 clk             : in std_logic; -- Clock for the system
        	 rst             : in std_logic; -- Resets the state machine

        -- Inputs
        	shoot           : in std_logic; -- User shoot
        	move_left       : in std_logic; -- User left
        	move_right      : in std_logic; -- User right
		  
		pixel_x         : in integer; -- X position of the cursor
		pixel_y		   : in integer; -- Y position of the cursor
	
        
		  -- Outputs
       		pixel_color		: out std_logic_vector (2 downto 0);
		state_out		: out integer
		
			
	);
	end component;

	signal current_state_out 	: integer;

	signal shoot_in		: std_logic;

	signal move_left_in 	: std_logic;
	signal move_right_in 	: std_logic;
	signal clk_in 		: std_logic;
	signal rst_in		:std_logic;

	signal pixel_x_in		: integer;
	signal pixel_y_in		: integer;

	constant clk_period	: time := 10 ns;

	signal pixel_color_out		: std_logic_vector (2 downto 0);
	

begin
	dut : game_controller
	port map(
		shoot => shoot_in,
		
		move_left => move_left_in,
		move_right => move_right_in,
		clk => clk_in,
		rst => rst_in,
		pixel_x => pixel_x_in,
		pixel_y => pixel_y_in,
		pixel_color => pixel_color_out,
		state_out => current_state_out
		
	);


	--clk_process: process
		--begin
		--	clk_in <= '0';
		--	wait for clk_period/2;
		--	clk_in <= '1';
		--	wait for clk_period/2;
		--end process;


	test: process
	begin

		wait for 50 ns;
		assert current_state_out = 1 report "Error, Case 0" severity Error;

		shoot_in <= '1';
		wait for 10 ns;
		assert current_state_out = 2 report "Error, Case 1" severity Error;
		shoot_in <= '0';

		--dut.ship.visible <= '0';
		--wait for 10 ns;
		--assert current_state_out = 3 report "Error, Case 2" severity Error;

		--dut.life_ctr := 0;
		--wait for 10 ns;
		--assert current_state_out = 4 report "Error, Case 3" severity Error;

		--dut.score <= 60;
		--wait for 10 ns;
		--assert current_state_out = 4 report "Error, Case 4" severity Error;
		
		rst_in <= '1';
		assert current_state_out = 0 report "Error, Case 4" severity Error;
		rst_in <= '0';
		
		wait;


	 
		


			--test: process
	--begin

	--	wait for clk_period;
	--	game_controller.current_state = game_controller.init;
		
	--	assert game_controller.current_state = game_controller.pre_game report "Error, Case 0" severity Error;
--
	--	game_controller.shoot <= '1';
	--	wait for 10 ns;
	--	assert game_controller.current_state = game_controller.gameplay report "Error, Case 1" severity Error;

		--game_controller.alien.y_pos = 432;
		--wait for 10 ns;
		--assert game_controller.current_state = game_controller.lost_life report "Error, Case 2" severity Error;

		--game_controller.life_ctr = 0;
		--wait for 10 ns;
		--assert game_controller.current_state = game_controller.game_over report "Error, Case 3" severity Error;
		
		--game_controller.life_ctr = 1;
		--wait for 10 ns;
	--	assert game_controller.current_state = game_controller.pre_game report "Error, Case 4" severity Error;

		--game_controller.score = 60;
		--wait for 10 ns;
		--assert game_controller.current_state = game_controller.game_over report "Error, Case 5" severity Error;

		--game_controller.ship.visible = '0';
		--wait for 10 ns;
	--	asser game_controller.current_state = game_controller.lost_life report "Error, Case 6" severity Error;

		--report "Test Success";
		--wait;

	end process;

end behaviour;
	

	
			
