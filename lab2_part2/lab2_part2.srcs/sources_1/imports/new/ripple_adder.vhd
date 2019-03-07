library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder is
    Port ( cin : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           s : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end ripple_adder;

architecture Behavioral of ripple_adder is

--components
component adder is
    Port (a, b, cin : in std_logic;
          s, cout : out std_logic);
end component;

--signals
signal cout_from0 : std_logic;
signal cout_from1 : std_logic;
signal cout_from2 : std_logic;
signal cout_from3 : std_logic;

begin
 add0: adder
 port map (a => a(0), b => b(0), cin => cin, s => s(0), cout => cout_from0);
 
 add1: adder
 port map (a => a(1), b => b(1), cin => cout_from0, s => s(1), cout => cout_from1);
 
 add2: adder
 port map (a => a(2), b => b(2), cin => cout_from1, s => s(2), cout => cout_from2);
 
 add3: adder
 port map (a => a(3), b => b(3), cin => cout_from2, s => s(3), cout => cout_from3);
 
 cout <= cout_from3;
 

end Behavioral;
