library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity add_sub is
    port(ctrl : in std_logic;
    a, b : in std_logic_vector(3 downto 0);
    res : out std_logic_vector(3 downto 0));
end add_sub;

    architecture rtl of add_sub is
        signal a_unsigned , b_unsigned, res_unsigned : unsigned(3 downto 0);
        begin
            a_unsigned <= unsigned(a);
            b_unsigned <= unsigned(b);
            res_unsigned <= a_unsigned - b_unsigned when ctrl = '1' else
        a_unsigned + b_unsigned;
        res <= std_logic_vector(res_unsigned);
        end rtl;