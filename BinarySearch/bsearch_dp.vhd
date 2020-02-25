library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity bsearch_dp is
    port (clk, rst, i_sel, j_sel, i_ld, j_ld, b_ld, notfound_in, add_ctrl : in std_logic;
    i, j : in std_logic_vector(3 downto 0);
    key : in std_logic_vector(7 downto 0);
    notfound, iltoreqj, keyeqL, keyltL : out std_logic;
    b : out std_logic_vector(3 downto 0));
end bsearch_dp;

architecture rtl of bsearch_dp is
    component mux_2_1 is
        port (s : in std_logic;
         a, b: in std_logic_vector(3 downto 0);
        y: out std_logic_vector(3 downto 0)) ;
    end component;
    component reg_par is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(3 downto 0);
        reg_out: out std_logic_vector(3 downto 0));
    end component;
    component add_sub is
            port(ctrl : in std_logic;
            a, b : in std_logic_vector(3 downto 0);
            res : out std_logic_vector(3 downto 0));
    end component;
    component comp8 is
        port(a, b : in std_logic_vector(7 downto 0);
        y : out std_logic);
    end component;
    component compless8 is
        port(a, b : in std_logic_vector(7 downto 0);
        y : out std_logic);
    end component;
    component lessthanorequal is
        port (a, b : in std_logic_vector(3 downto 0);
        y : out std_logic);
    end component;
    component half_avg is
        port(a, b : in std_logic_vector(3 downto 0);
        y : out std_logic_vector(3 downto 0));
    end component;
    component rom_16x8bit is
        port(addr: in std_logic_vector (3 downto 0);
        data: out std_logic_vector (7 downto 0));
    end component;
    signal  i_in, i_temp, kplus_minus1, j_temp, j_in, k : std_logic_vector(3 downto 0);
    signal L : std_logic_vector(7 downto 0);
    
    begin
        i_mux : mux_2_1 port map (i_sel, kplus_minus1, i, i_in);
        i_reg : reg_par port map (clk, rst, i_ld, i_in, i_temp);
        j_mux : mux_2_1 port map (j_sel, kplus_minus1, j, j_in);
        j_reg : reg_par port map (clk, rst, j_ld, j_in, j_temp);
        b_reg : reg_par port map (clk, rst, b_ld, k, b);
        L_rom : rom_16x8bit port map (k, L);
        ilessthanorequal : lessthanorequal port map (i_temp, j_temp, iltoreqj);
        Lkey_comp : comp8 port map (L, key, keyeqL);
        Lkey_compless : compless8 port map (key, L, keyltL);
        ij_halfavg : half_avg port map (i_temp, j_temp, k);
        j_add : add_sub port map (add_ctrl, k, "0001", kplus_minus1);
        notfound <= notfound_in;
    end rtl;


