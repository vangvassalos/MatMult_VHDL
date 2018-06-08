library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.matmult_pkg.all;
 
entity matmult_tb is
end matmult_tb;

architecture behave of matmult_tb is

    constant c_CLK_PERIOD : time := 10 ns;

    signal r_CLK    : std_logic := '0';
    signal r_RST    : std_logic := '0';
    signal r_A      : t_in_mat := (others => (others => (others => '0')));
    signal r_B      : t_in_mat := (others => (others => (others => '0')));
    signal w_RESULT : t_out_mat := (others => (others => (others => '0')));
    
    signal x        : unsigned (15 downto 0) := (others => '0');
    signal y        : unsigned (31 downto 0) := (others => '0');
    
    signal s      : integer := 0;
    signal f      : integer := 0;
        
begin
 
  MULT_TOP_INST : matmult_top
    port map (
        clk   => r_CLK,
        rst   => r_RST,
        a     => r_A,
        b     => r_B,
        c     => w_RESULT
        );

  p_CLK_GEN : process is 
  begin
    wait for c_CLK_PERIOD/2;
        r_CLK <= not r_CLK;
  end process p_CLK_GEN;

  process
  begin
  
    r_RST <= '1';
    wait for c_CLK_PERIOD;
    r_RST <= '0';
    
    -- Load Matrix
    r_A <= ((std_logic_vector(x+1),std_logic_vector(x+1),std_logic_vector(x+1)),(std_logic_vector(x+1),std_logic_vector(x+1),std_logic_vector(x+1)),(std_logic_vector(x+1),std_logic_vector(x+1),std_logic_vector(x+1)));
    r_B <= ((std_logic_vector(x+1),std_logic_vector(x+1),std_logic_vector(x+1)),(std_logic_vector(x+1),std_logic_vector(x+1),std_logic_vector(x+1)),(std_logic_vector(x+1),std_logic_vector(x+1),std_logic_vector(x+1)));
    wait for c_CLK_PERIOD*3;

    -- Check Result
    if w_RESULT = ((std_logic_vector(y+3),std_logic_vector(y+3),std_logic_vector(y+3)),(std_logic_vector(y+3),std_logic_vector(y+3),std_logic_vector(y+3)),(std_logic_vector(y+3),std_logic_vector(y+3),std_logic_vector(y+3))) then
        report "SUCCESS";
        s <= s + 1;
    else
        report "FAILURE";
        f <= f + 1;
    end if;
    
    -- Load Matrix
    r_A <= ((std_logic_vector(x+2),std_logic_vector(x+2),std_logic_vector(x+2)),(std_logic_vector(x+2),std_logic_vector(x+2),std_logic_vector(x+2)),(std_logic_vector(x+2),std_logic_vector(x+2),std_logic_vector(x+2)));
    r_B <= ((std_logic_vector(x+3),std_logic_vector(x+3),std_logic_vector(x+3)),(std_logic_vector(x+3),std_logic_vector(x+3),std_logic_vector(x+3)),(std_logic_vector(x+3),std_logic_vector(x+3),std_logic_vector(x+3)));
    wait for c_CLK_PERIOD*3;
    
    -- Check Result
    if w_RESULT = ((std_logic_vector(y+18),std_logic_vector(y+18),std_logic_vector(y+18)),(std_logic_vector(y+18),std_logic_vector(y+18),std_logic_vector(y+18)),(std_logic_vector(y+18),std_logic_vector(y+18),std_logic_vector(y+18))) then
        report "SUCCESS";
        s <= s + 1;
    else
        report "FAILURE";
        f <= f + 1;
    end if;   
     
    end process;
   
end behave;