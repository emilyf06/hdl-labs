-------------------------------------------------------------------------------
--Violet Frazier
-- counter thing
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity top is
  port (
    clk             : in  std_logic; 
    reset           : in  std_logic;
    output          : out std_logic_vector(6 downto 0)
  );
end top;

architecture beh of top is
constant bits : integer := 4;


component frazier_counter is
  port(
      clk           :IN std_logic;
     reset         :IN std_logic;
     binary_input  :IN std_logic_vector(3 downto 0);
     HEX0          :OUT std_logic_vector(6 downto 0)
        );
end component;

component generic_adder_beh is 
  port(
    a       : in  std_logic_vector(bits-1 downto 0);
    b       : in  std_logic_vector(bits-1 downto 0);
    cin     : in  std_logic;
    sum     : out std_logic_vector(bits-1 downto 0);
    cout    : out std_logic
  );
end component;

component generic_counter is 
    generic (max_count : integer :=3);
  port(
    clk             : in  std_logic; 
    reset           : in  std_logic;
    output          : out std_logic
  );
end component;

signal enable : std_logic;
signal sum    : std_logic_vector(bits-1 downto 0);
signal sum_sig   : std_logic_vector(bits-1 downto 0);

begin

uut: frazier_counter
  port map(
     clk           => clk,
     reset         => reset,
     binary_input  => sum,
     HEX0          => output
  );
  
uuy: generic_adder_beh 
  port map(
    a       => sum_sig,
    b       =>  "0001",
    cin     => '0',
    sum     => sum,
    cout    => open
  );

uuz: generic_counter 
  generic map( max_count => 500000000)
  port map(
    clk       => clk,
    reset     => reset,
    output    => enable
  );
    
 process(reset, clk)
  begin
   if(reset ='1') then
     sum_sig <= "1111";
   elsif rising_edge(clk)  then 
     if (enable = '1') then 
       sum_sig <= sum;
     end if;
   end if;
end process;
    
end beh;

