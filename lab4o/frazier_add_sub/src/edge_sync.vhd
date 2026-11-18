------------------------
--Violet Frazier--------
--Lab 4-----------------
------------------------

library ieee;
use ieee.std_logic_1164.all;

entity edge_sync is
    port( 
          clk          :IN  std_logic;
          reset        :IN  std_logic;
          edge_input   :IN  std_logic;
          edge_output  :OUT std_logic
          );
end edge_sync;

architecture arch of edge_sync is
--components
--none in this case i belive

--signals
signal input_1    :std_logic;
signal input_2    :std_logic;
signal input_3    :std_logic;
--rememeber needs to go through a couple of times to by synched

--process
begin

synchronizer : process(reset, clk, edge_input)
begin  
--reset 
    if reset = '1' then
        input_1 <= '1';
        input_2 <= '1';
    elsif rising_edge(clk) then
    --let the inputs trinckle down and synch
        input_1 <= edge_input;
        input_2 <= input_1;
    end if;
end process;
    
edge_detector : process(reset, clk, input_2) is
begin
--reset
    if (reset = '1') then
    edge_output <= '0';
    input_3     <= '1';
    elsif rising_edge(clk) then
        input_3 <= input_2;
        edge_output <= (input_2 xor input_3) and input_2; --checks if input gone through at least 2 clk cycles to synch
    end if;
end process;
end arch;