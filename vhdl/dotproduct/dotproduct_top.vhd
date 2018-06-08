library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.dotproduct_pkg.all;

library ieee_proposed;
use ieee_proposed.float_pkg.all;

entity dotproduct_top is
    port (
        i_CLK       : in std_logic;
        i_RST       : in std_logic;
        i_A         : in t_in_vec;
        i_B         : in t_in_vec;
        o_C         : out float32
        );
end dotproduct_top;

architecture behave of dotproduct_top is

    signal r_RESULT : float32               := (others => '0');
    signal r_A      : t_in_vec              := (others => (others => '0'));
    signal r_B      : t_in_vec              := (others => (others => '0'));

begin

    p_dotproduct : process (i_CLK) is
    begin
        if rising_edge(i_CLK) then
            r_RESULT <= dotproduct(r_A, r_B);
        end if;
    end process;

   r_A <= i_A;
   r_B <= i_B;
   o_C <= r_RESULT;
end behave;
