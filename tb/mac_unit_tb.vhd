library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity MAC_tb is
end entity MAC_tb;

architecture sim of MAC_tb is

	-- Constant declaration
	constant WIDTH_TB   : integer := 8;
	constant CLK_PERIOD : time    := 10 ns; -- 100 MHz clock
	
	-- Testbench Signals
	signal clk   : std_logic := '0';
	signal reset : std_logic := '0';
	signal n1    : signed(WIDTH_TB-1 downto 0) := (others => '0');
	signal n2    : signed(WIDTH_TB-1 downto 0) := (others => '0');
	signal count : signed((WIDTH_TB*2)+3 downto 0);
	
begin

	-- Instantiate UUT
	uut: entity work.MAC
		generic map (
			WIDTH => WIDTH_TB
		)
		port map (
			clk => clk,
			reset => reset,
			n1    => n1,
			n2    => n2,
			count => count
		);
		
	-- Clock Generation
	process is
	begin
		clk <= '0';
		wait for CLK_PERIOD / 2;
		clk <= '1';
		wait for CLK_PERIOD / 2;
	end process;
	
	-- Stimulus process
	process is
	begin
		-- 1. Apply reset
		reset <= '1';
		wait for CLK_PERIOD * 2;
		reset <= '0';
		wait for CLK_PERIOD;
		
		-- 2. First calculation 3 * 4 = 12
		-- Espected count = 12
		n1 <= to_signed(3, WIDTH_TB);
		n2 <= to_signed(4, WIDTH_TB);
		wait for CLK_PERIOD;
		
		-- 3. Second calculation 5 * (-2) = -10
		-- Expected count = 12 + (-10) = 2
        n1 <= to_signed(5, WIDTH_TB);
        n2 <= to_signed(-2, WIDTH_TB);
        wait for CLK_PERIOD;
		
		-- 4. Third calculation: 10 * 10 = 100
        -- Expected count = 2 + 100 = 102
        n1 <= to_signed(10, WIDTH_TB);
        n2 <= to_signed(10, WIDTH_TB);
        wait for CLK_PERIOD;
		
		-- 5. Clear inputs and wait
        n1 <= to_signed(0, WIDTH_TB);
        n2 <= to_signed(0, WIDTH_TB);
        wait for CLK_PERIOD * 3;
		
		-- End Simulation
		wait;
	end process;
end architecture;
