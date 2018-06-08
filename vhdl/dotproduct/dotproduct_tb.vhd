library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.dotproduct_pkg.all;

library ieee_proposed;
use ieee_proposed.float_pkg.all;

entity dotproduct_tb is
end dotproduct_tb;

architecture behave of dotproduct_tb is

    constant c_CLK_PERIOD : time := 10 ns;

    signal r_CLK    : std_logic                 := '0';
    signal r_RST    : std_logic                 := '0';
    signal r_A      : t_in_vec                  := (others => (others => '0'));
    signal r_B      : t_in_vec                  := (others => (others => '0'));
    signal w_RESULT : float32                   := (others => '0');

    signal x        : float32                   := (others => '0');
    signal y        : float32                   := (others => '0');

begin

  dotproduct_TOP_INST : dotproduct_top
    port map (
        i_CLK   => r_CLK,
        i_RST   => r_RST,
        i_A     => r_A,
        i_B     => r_B,
        o_C     => w_RESULT
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
    r_A <= (x+1,x+1,x+1);
    r_B <= (x+1,x+1,x+1);
    wait for c_CLK_PERIOD;
    if w_RESULT = y+3 then
        report "SUCESS";
    else
        report "FAILURE";
    end if;
    r_A <= (x+2,x+2,x+2);
    r_B <= (x+3,x+3,x+3);
    wait for c_CLK_PERIOD;
    if w_RESULT = y+18 then
        report "SUCESS";
    else
        report "FAILURE";
    end if;

    end process;

end behave;
