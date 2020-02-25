library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity reg_par is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(3 downto 0);
reg_out: out std_logic_vector(3 downto 0));
end reg_par;
architecture rtl of reg_par is
begin
process (rst, clk)
begin
if (rst = '1') then
reg_out <= (others => '0');
elsif (rising_edge(clk)) then
if (en = '1') then
reg_out <= reg_in;
end if;
end if;
end process;
end rtl;