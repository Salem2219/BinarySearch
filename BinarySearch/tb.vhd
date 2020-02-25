library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tb is
end tb ;

architecture behav of tb is
  constant clockperiod: time:= 0.1 ns;
  signal clk: std_logic:='0';
  signal rst,start, notfound: std_logic;
  signal i, j, b : std_logic_vector(3 downto 0);
  signal key : std_logic_vector (7 downto 0);
  component bsearch
     port (clk, rst, start : in std_logic;
    key : in std_logic_vector (7 downto 0);
    i, j : in std_logic_vector (3 downto 0);
    notfound : out std_logic;
    b : out std_logic_vector (3 downto 0));
  end component ;
  begin
    clk <= not clk after clockperiod /2;
    rst <= '1' , '0' after 0.1 ns;
    start <= '0' , '1' after 0.1 ns, '0' after 0.5 ns;
    key <= "00010100";
    i <= "0000";
    j <= "1111";
    dut: bsearch port map(clk,rst,start,key,i,j,notfound, b);
  end behav;