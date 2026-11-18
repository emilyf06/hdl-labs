-------------------------------------------------------------------------------
--Violet Frazier
-- top level for Lab 4
--Modified from Lab 3
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

--change these components to components using in Lab 4
component frazier_add_sub is
  port(
    clk           : in  std_logic;
    reset         : in  std_logic;
    a             : in  std_logic_vector(2 downto 0);
    b             : in  std_logic_vector(2 downto 0);
    add_btn       : in  std_logic;
    sub_btn       : in  std_logic;
    a_bcd         : out std_logic_vector(6 downto 0);
    b_bcd         : out std_logic_vector(6 downto 0);
    result_bcd    : out std_logic_vector(6 downto 0)
  );
end component;

component generic_add_sub is 
  port(
    a       : in  std_logic_vector(bits-1 downto 0);
    b       : in  std_logic_vector(bits-1 downto 0);
    flag    : in  std_logic; -- 0: add 1: sub
    c       : out std_logic_vector(bits downto 0)
  );
end component;

component sync_to_three is 
    generic (max_count : integer :=3); --do i need this?
  port(
        clk            :IN  std_logic;
        reset          :IN  std_logic;
        asynch_in      :IN  std_logic_vector(3 downto 0); --the add_sum will give out a 4 bit answer
        synch_out      :OUT std_logic_vector(2 downto 0)
  );
end component;

component seven_seg_disp is --do i need this?
   port( 
     clk           :IN std_logic;
     reset         :IN std_logic;
     binary_input  :IN std_logic_vector(3 downto 0);
     HEX0          :OUT std_logic_vector(6 downto 0)
        );
end component;

component edge_sync is  --do i need this
    port( 
          clk          :IN  std_logic;
          reset        :IN  std_logic;
          edge_input   :IN  std_logic;
          edge_output  :OUT std_logic
          );
end component;


--modify signals to signals used in lab4
signal enable : std_logic;
signal sum    : std_logic_vector(bits-1 downto 0);
signal sum_sig   : std_logic_vector(bits-1 downto 0);

begin
--uut that sh*t
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
    
    --most proabably gotta change this
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

