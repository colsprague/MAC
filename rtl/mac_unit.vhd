library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity MAC is
	generic (
		WIDTH : integer := 8
	);
	port (
		clk   : in std_logic;
		reset : in std_logic;
		
		-- Inputs are 8-bit (WIDTH)
		n1    : in  signed(WIDTH-1 downto 0);
		n2    : in  signed(WIDTH-1 downto 0);
		
		-- Output is 16-bit at least (WIDTH*2)
		count : out signed((WIDTH*2)+3 downto 0)
	);
end entity;

architecture rtl of MAC is
	-- Internal Signals
	signal product : signed((WIDTH*2)-1 downto 0);
	signal accum   : signed((WIDTH*2)+3 downto 0); -- extra bits for running total
	
begin
	-- Sequential
	process(clk, reset) is
	begin
		if reset = '1' then
			accum <= (others => '0');
		elsif rising_edge(clk) then
			accum <= accum + resize(product, accum'length); -- Must add equal bit-widths
		end if;
	end process;
	
	-- Combinational
	product <= n1 * n2;
	count   <= accum;

end architecture;
