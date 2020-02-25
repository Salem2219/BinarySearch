library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity lessthanorequal is
    port (a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end lessthanorequal;

architecture rtl of lessthanorequal is
    component comp is
        port(a, b : in std_logic_vector(3 downto 0);
        y : out std_logic);
    end component;
    component compless is
        port(a, b : in std_logic_vector(3 downto 0);
        y : out std_logic);
    end component;
    component or_gate is
        port (a,b : in std_logic;
        y : out std_logic);
    end component;
    signal eq, less : std_logic;
    begin
        u1 : comp port map (a, b, eq);
        u2 : compless port map (a, b, less);
        u3 : or_gate port map(eq, less, y);
    end rtl;
    