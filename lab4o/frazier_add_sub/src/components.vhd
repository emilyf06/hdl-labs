-------------------------------------------------------------------------------
-- Dr. Kaputa
-- components package
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package components is
  component edge_sync is 
    port (
      clk               : in std_logic;
      reset             : in std_logic;
      edge_input             : in std_logic;
      edge_output              : out std_logic
    );
  end component;
  
  component sync_to_three is 
    port (
      clk               : in std_logic;
      reset             : in std_logic;
      async_in          : in std_logic_vector(2 downto 0);
      sync_out          : out std_logic_vector(2 downto 0)
    );
  end component;
  
  component generic_add_sub is
    generic (
      bits    : integer := 3
    );
    port (
      a       : in  std_logic_vector(bits-1 downto 0);
      b       : in  std_logic_vector(bits-1 downto 0);
      flag    : in std_logic;
      c       : out std_logic_vector(bits downto 0)
    );
  end component generic_add_sub;
  
  component seven_seg_disp is
    port ( 
     clk           :IN std_logic;
     reset         :IN std_logic;
     binary_input  :IN std_logic_vector(3 downto 0);
     HEX0          :OUT std_logic_vector(6 downto 0)
        );  
  end component;  
end components;