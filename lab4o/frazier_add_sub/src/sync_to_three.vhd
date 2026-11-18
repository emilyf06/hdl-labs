------------------
-------Violet, lots taken from Dr. Kaputa
---------
library ieee;
use ieee.std_logic_1164.all;

entity sync_to_three is
    port(
        clk            :IN  std_logic;
        reset          :IN  std_logic;
        async_in      :IN  std_logic_vector(2 downto 0); --the add_sum will give out a 4 bit answer
        sync_out      :OUT std_logic_vector(2 downto 0)
  );
end sync_to_three;

architecture arch of sync_to_three is
--signals
signal flop1       :std_logic_vector(2 downto 0); ---remember that the add sum is going to be 4 bits, see if this needs to be changed or what
signal flop2       :std_logic_vector(2 downto 0);

begin
begindobule_flop : process(reset, clk , async_in)
    begin
        if reset = '1' then
            flop1 <= "000";
            flop2 <= "000";
        elsif rising_edge(clk) then
            flop1 <= async_in;
            flop2 <= flop1;
        end if;
    end process;
    
sync_out <= flop2;
end arch;