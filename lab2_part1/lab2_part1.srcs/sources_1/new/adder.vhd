library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
end adder;

architecture Behavioral of adder is
signal sub_abxor : std_logic;
signal sub_addand : std_logic;
signal sub_xorand : std_logic;
begin

sub_abxor <= a XOR b;
sub_addand <= a AND b;
sub_xorand <= sub_abxor AND cin;
s <= sub_abxor XOR cin;
cout <= sub_addand OR sub_xorand;

end Behavioral;
