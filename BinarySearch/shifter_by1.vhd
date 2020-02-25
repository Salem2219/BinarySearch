library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity shifter_by1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end shifter_by1;

architecture rtl of shifter_by1 is
    begin
        y(2 downto 0) <= a(3 downto 1);
        y(3) <= '0';
    end rtl;