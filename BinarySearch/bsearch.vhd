library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity bsearch is
    port (clk, rst, start : in std_logic;
    key : in std_logic_vector (7 downto 0);
    i, j : in std_logic_vector (3 downto 0);
    notfound : out std_logic;
    b : out std_logic_vector (3 downto 0));
end bsearch ;

architecture rtl of bsearch is
    component bsearch_dp is
        port (clk, rst, i_sel, j_sel, i_ld, j_ld, b_ld, notfound_in, add_ctrl : in std_logic;
    i, j : in std_logic_vector(3 downto 0);
    key : in std_logic_vector(7 downto 0);
    notfound, iltoreqj, keyeqL, keyltL : out std_logic;
    b : out std_logic_vector(3 downto 0));
    end component;
    component bsearch_ctrl is
        port (clk,rst,start, iltoreqj, keyeqL, keyltL : in std_logic ;
i_sel, j_sel,  i_ld, j_ld, b_ld, add_ctrl, notfound_in: out std_logic); 
    end component;
    signal i_sel, j_sel, i_ld, j_ld, b_ld, notfound_in, iltoreqj, keyeqL, keyltL, add_ctrl : std_logic;
    begin
    datapath : bsearch_dp port map (clk, rst, i_sel, j_sel, i_ld, j_ld, b_ld, notfound_in, add_ctrl, i, j, key, notfound, iltoreqj, keyeqL, keyltL, b);
    control : bsearch_ctrl port map (clk,rst,start,  iltoreqj, keyeqL, keyltL, i_sel, j_sel,  i_ld, j_ld, b_ld, add_ctrl, notfound_in);
    end rtl;