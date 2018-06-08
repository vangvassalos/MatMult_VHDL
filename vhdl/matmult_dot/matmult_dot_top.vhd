library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.matmult_dot_pkg.all;

entity matmult_dot_top is
    port (
        i_CLK       : in std_logic;
        i_RST       : in std_logic;
        i_A         : in t_in_mat;
        i_B         : in t_in_mat;
        o_C         : out t_out_mat
        );
end matmult_dot_top;

architecture behave of matmult_dot_top is

    signal r_RESULT : t_out_mat := (others => (others => (others => '0')));
    signal r_A      : t_in_mat := (others => (others => (others => '0')));
    signal r_B      : t_in_mat := (others => (others => (others => '0')));

begin

    p_MAT_MUL : process (i_CLK) is
    begin
        if rising_edge(i_CLK) then
            for i in 0 to t_in_mat'length-1 loop
                for j in 0 to t_in_mat'length-1 loop
                    r_RESULT(i)(j) <= dotproduct(r_A(i), r_B(j));
                end loop;
            end loop;
        end if;
    end process;

   r_A <= i_A;
   r_B <= i_B;
   o_C <= r_RESULT;
end behave;
