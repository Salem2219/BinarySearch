library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity rom_16x8bit is
    port(addr: in std_logic_vector (3 downto 0);
    data: out std_logic_vector (7 downto 0));
    end rom_16x8bit;
    architecture rtl of rom_16x8bit is
    type rom_type is array (0 to 15) of
    std_logic_vector (7 downto 0);
    constant program : rom_type := (
    "00000000", -- sample contents
    "00000001",
    "00000010",
    "00000011",
    "00000100",
    "00000101",
    "00000111",
    "00001101",
    "00010000",
    "00010100",
    "10100000",
    "10001111",
    "11100000",
    "11110000",
    "11111000",
    "11111111");
    begin
    data <= program(conv_integer(unsigned(addr)));
    end rtl;