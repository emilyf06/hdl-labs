-------------------------------------------------------------------------------
-- Emily Francisco
-- Counter top
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
  port (
    clk             : in std_logic;
    reset           : in std_logic;
    sum : out std_logic_vector(3 downto 0);
    sum_sig : out std_logic_vector(3 downto 0);
	 seven_seg_out   : out std_logic_vector(6 downto 0)
  );
end counter;

architecture behavior of counter is

  component seven_seg is
    port (
      clk             : in std_logic; 
      reset           : in std_logic;
      bcd             : in std_logic_vector(3 downto 0);
      seven_seg_out   : out std_logic_vector(6 downto 0)
    );  
  end component;

  component generic_adder_beh is
    generic (
      bits    : integer := 4
    );
    port (
      a       : in  std_logic_vector(bits-1 downto 0);
      b       : in  std_logic_vector(bits-1 downto 0);
      cin     : in  std_logic;
      sum     : out std_logic_vector(bits-1 downto 0);
      cout    : out std_logic
    );
  end component;

  component generic_counter is
    generic (
      max_count       : integer := 3
    );
    port (
      clk             : in  std_logic; 
      reset           : in  std_logic;
      output          : out std_logic
    );  
  end component;
  
  signal bcd          : std_logic_vector(3 downto 0);
  signal bcd_sig      : std_logic_vector(3 downto 0);
  signal cout         : std_logic;
  signal enable       : std_logic;       
begin

  process(reset,clk)
  begin
    if(reset = '1') then                 
      bcd_sig  <= "0000";
    elsif(clk'event and clk = '1')  then 
      if(enable = '1') then             
        if(bcd = "1010")then             
          bcd_sig <= "0000";             
        else
          bcd_sig <= bcd;               
        end if;
      end if;
    end if;
  end process;


  adder: generic_adder_beh           
    port map(        
      a              => "0001",        
      b              =>  bcd_sig,
      cin            => '0',            
      sum            => bcd,            
      cout           => cout           
    );

  counter_flag: generic_counter  
    port map(          
      clk            => clk,             
      reset          => reset,
      output         => enable          
    );
  
  display: seven_seg  
    port map(        
      clk            => clk,
      reset          => reset,
      bcd            => bcd_sig,        
      seven_seg_out  => seven_seg_out    
    );

end behavior;