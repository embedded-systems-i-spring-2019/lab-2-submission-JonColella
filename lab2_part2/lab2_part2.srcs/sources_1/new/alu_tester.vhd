library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_tester is
    Port ( btn : in STD_LOGIC_VECTOR (3 downto 0);
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           clk : inout std_logic;
           led : out STD_LOGIC_VECTOR (3 downto 0));
end alu_tester;

architecture rtl_ckt of alu_tester is

--components
component debounce is
Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           dbnc : out STD_LOGIC);
end component;

component alu is
Port ( opcode : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0));
end component;

--signals
signal dbnc_0 : std_logic;
signal dbnc_1 : std_logic;
signal dbnc_2 : std_logic;
signal dbnc_3 : std_logic;
signal debounced : std_logic_vector (3 downto 0);
signal opcode_input : std_logic_Vector (3 downto 0);
signal a_input : std_logic_vector (3 downto 0);
signal b_input : std_logic_vector (3 downto 0);
signal alu_output : std_logic_vector (3 downto 0);
begin

--debounce the buttons
dba: debounce
port map (clk => clk, btn => btn(0), dbnc => dbnc_0);

dbb: debounce
port map (clk => clk, btn => btn(1), dbnc => dbnc_1);

dbc: debounce
port map (clk => clk, btn => btn(2), dbnc => dbnc_2);

dbd: debounce
port map (clk => clk, btn => btn(3), dbnc => dbnc_3);

debounced <= dbnc_0 & dbnc_1 & dbnc_2 & dbnc_3;

process(clk) --gathering input
begin
    if(rising_edge(clk)) then
        if (debounced(2) = '1') then
            opcode_input <= sw;
        elsif (debounced(1) = '1') then
            a_input <= sw;
        elsif (debounced(0) = '1') then
            b_input <= sw;
        elsif (debounced(3) = '1') then
            opcode_input <= "0000";
            a_input <= "0000";
            b_input <= "0000";
        end if;
    end if;
    
led <= alu_output; --write the output to the LEDs
end process;

dut: alu
port map (opcode => opcode_input, a => a_input, b => b_input, output => alu_output);
end rtl_ckt;
