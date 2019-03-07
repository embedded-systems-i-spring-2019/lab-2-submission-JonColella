library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is
    Port ( opcode : in STD_LOGIC_VECTOR (3 downto 0);
           a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0));
end alu;

architecture Behavioral of alu is
--components

begin
    main: process(opcode)
    begin
        case (opcode) is --main case statement for ALU operations
        when "0000" => output <= A + B;
        when "0001" => output <= A - B;
        when "0010" => output <= A + 1;
        when "0011" => output <= A - 1;
        when "0100" => output <= 0 - A;
        when "0101" => if (A > B) then output <= "0001"; else output <= "0000"; end if;
        when "0110" => output <= std_logic_vector(shift_left(unsigned(A), 1));
        when "0111" => output <= std_logic_vector(shift_right(unsigned(A), 1));
        when "1000" => output <= std_logic_vector(shift_right(signed(A), 1));
        when "1001" => output <= NOT A;
        when "1010" => output <= A AND B;
        when "1011" => output <= A OR B;
        when "1100" => output <= A XOR B;
        when "1101" => output <= A XNOR B;
        when "1110" => output <= A NAND B;
        when "1111" => output <= A NOR B;
        end case;
    end process;

end Behavioral;
