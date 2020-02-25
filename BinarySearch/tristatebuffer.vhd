library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tristatebuffer is
    port(x, ctrl : in std_logic;
    y : out std_logic);
end tristatebuffer;

architecture rtl of tristatebuffer is
begin
    y <= ctrl and x;
end rtl;
