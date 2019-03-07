library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ripple_adder_tb is
end ripple_adder_tb;

architecture testbench of ripple_adder_tb is

--components
component ripple_adder
    Port ( cin : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           s : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end component;

--signals
signal tb_a : std_logic_vector (3 downto 0) := "0000";
signal tb_b : std_logic_vector (3 downto 0) := "0000";
signal tb_s : std_logic_vector (3 downto 0) := "0000";
signal tb_cin : std_logic := '0';
signal tb_cout : std_logic;

begin

dut: ripple_adder port map (cin => tb_cin, a => tb_a, b => tb_b, s => tb_s, cout => tb_cout);

process begin
    wait for 10ns;
    tb_a <= tb_a +1;
    if (tb_a = "0000") then
    tb_b <= tb_b +1;
    end if;
    if (tb_b = "1111") then
    tb_cin <= '1';
    end if;
end process;
end testbench;
