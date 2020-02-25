library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity mux_2_1 is
port (s : in std_logic;
 a, b: in std_logic_vector(3 downto 0);
y: out std_logic_vector(3 downto 0)) ;
end mux_2_1;
architecture first of mux_2_1 is
begin
y <= a when s = '1' else
b;
end first;