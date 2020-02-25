library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity half_avg is
    port(a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end half_avg;

architecture rtl of half_avg is
    signal aplusb : unsigned(4 downto 0);
    signal a5, b5 : std_logic_vector(4 downto 0);
    begin
        a5(3 downto 0) <= a(3 downto 0);
        b5(3 downto 0) <= b(3 downto 0);
        a5(4) <= '0';
        b5(4) <= '0';
        aplusb <= unsigned(a5) + unsigned(b5);
        y <= std_logic_vector(aplusb(4 downto 1));
    end rtl;