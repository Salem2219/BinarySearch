library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity bsearch_ctrl is
port (clk,rst,start, iltoreqj, keyeqL, keyltL : in std_logic ;
i_sel, j_sel,  i_ld, j_ld, b_ld, add_ctrl, notfound_in: out std_logic);
end bsearch_ctrl ;

architecture rtl of bsearch_ctrl is
  type state_type is (s0,s1,s2,s3,s4);
  signal current_state : state_type ;
  signal next_state : state_type ;
begin
  process(clk,rst)
  begin
    if (rst = '1') then
      current_state <= s0;
    elsif (rising_edge(clk)) then
      current_state <= next_state;
    end if;
  end process;

  process (current_state,iltoreqj, keyeqL, keyltL, start)
  begin
    case current_state is
    when s0 =>
    i_sel <= '0';
    j_sel <= '0';
    i_ld <= '0';
    j_ld <= '0';
    b_ld <= '0';
    add_ctrl <= '0';
    notfound_in <= '0';
    next_state <= s1;
    when s1 =>
    i_sel <= '0';
    j_sel <= '0';
    i_ld <= '1';
    j_ld <= '1';
    b_ld <= '0';
    add_ctrl <= '0';
    notfound_in <= '0';
    if (start ='1') then
    next_state <= s2;
    else
    next_state <= s1;
    end if;
    when s2 =>
    i_sel <= '0';
    j_sel <= '0';
    i_ld <= '0';
    j_ld <= '0';
    b_ld <= '0';
    add_ctrl <= '0';
    notfound_in <= '0';
    if(iltoreqj = '1') then
    next_state <= s3;
    else
    next_state <= s4;
    end if;
    when s3 =>
    i_sel <= '1';
    j_sel <= '1';
    i_ld <= keyeqL nor keyltL;
    j_ld <= not keyeqL and keyltL;
    b_ld <= keyeqL;
    add_ctrl <= keyeqL or keyltL; 
    notfound_in <= '0';
    if(keyeqL = '0') then
        next_state <= s2;
    else
        next_state <= s1;
    end if;
    when others =>
    i_sel <= '0';
    j_sel <= '0';
    i_ld <= '0';
    j_ld <= '0';
    b_ld <= '0';
    add_ctrl <= '0';
    notfound_in <= '1';
      next_state <= s1;
    end case;
  end process;
end rtl;
