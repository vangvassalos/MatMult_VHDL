library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.matmult_pkg.all;

entity matmult_top is
    port (
        clk       : in std_logic;
        rst       : in std_logic;
        a         : in t_in_mat;
        b         : in t_in_mat;
        c         : out t_out_mat
        );
end matmult_top;

architecture behave of matmult_top is

    signal r_RESULT : t_out_mat := (others => (others => (others => '0')));
    signal r_A      : t_in_mat  := (others => (others => (others => '0')));
    signal r_B      : t_in_mat  := (others => (others => (others => '0')));

begin

    g_ROW_MUL : for i in 0 to t_in_mat'length-1 generate
        g_COL_MUL: for j in 0 to t_in_mat'length-1 generate  
            ROW_COL_MULT : matmult_core
                port map (
                            i_CLK => clk,
                            i_RST => rst,
                            i_A  => r_A(i),
                            i_B  => r_B(j),
                            o_C  => r_RESULT(i)(j)
                          );
        end generate g_COL_MUL;
    end generate g_ROW_MUL;

    r_A <= a;
    r_B <= b;
    c <= r_RESULT;
end behave;
