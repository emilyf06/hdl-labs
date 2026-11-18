--Violet Frazier
--Lab 3
--Hardware Description Language

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity frazier_counter is
   port( 
      clk           :IN std_logic;
     reset         :IN std_logic;
     binary_input  :IN std_logic_vector(3 downto 0);
     HEX0          :OUT std_logic_vector(6 downto 0)
        );
end frazier_counter;

architecture arch of frazier_counter is

--components if needed


--signals if needed
-----------signal input : std_logic_vector(3 downto  0);
--use consts to get all 10 digits 0000000
constant ZERO  : std_logic_vector(6 downto 0) := "1000000";
constant ONE   : std_logic_vector(6 downto 0) := "1111001";
constant TWO   : std_logic_vector(6 downto 0) := "0100100";
constant THREE : std_logic_vector(6 downto 0) := "0110000";
constant FOUR  : std_logic_vector(6 downto 0) := "0011001";
constant FIVE  : std_logic_vector(6 downto 0) := "0010010";
constant SIX   : std_logic_vector(6 downto 0) := "0000010";
constant SEVEN : std_logic_vector(6 downto 0) := "1111000";
constant EIGHT : std_logic_vector(6 downto 0) := "0000000";
constant NINE  : std_logic_vector(6 downto 0) := "0011000";


begin
--processes
--note for vi: embed resets in the future so they actually take effect.  
HEXout : process(reset, binary_input) is
begin
if(reset = '1') then 
else
      case(binary_input) is
         when "0000" => HEX0 <= ZERO;
         when "0001" => HEX0 <= ONE;
         when "0010" => HEX0 <= TWO;
         when "0011" => HEX0 <= THREE;
         when "0100" => HEX0 <= FOUR;
         when "0101" => HEX0 <= FIVE;
         when "0110" => HEX0 <= SIX;
         when "0111" => HEX0 <= SEVEN;
         when "1000" => HEX0 <= EIGHT;
         when "1001" => HEX0 <= NINE;
         when others => HEX0 <= ZERO;
      end case;
end if;
   end process;


end arch;