-------------------------------------------------------------------------------
-- Emily Francisco
-- single bit full adder [structural architecture]
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder_single_bit_arch is
  port (
    a    : in std_logic;
    b    : in std_logic;
    cin  : in std_logic;
    sum  : out std_logic;
    cout : out std_logic
  );
end full_adder_single_bit_arch;

architecture struct of full_adder_single_bit_arch is

begin
  sum  <= a xor b xor cin;
  cout <= a and b or a and cin or b and cin;
end struct;