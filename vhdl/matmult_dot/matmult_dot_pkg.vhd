library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

library ieee_proposed;
use ieee_proposed.float_pkg.all;

package matmult_dot_pkg is

    constant n : integer := 2;

    type t_in_vec is array (0 to n) of float32;
    type t_in_mat is array(0 to n) of t_in_vec;
    type t_out_vec is array (0 to n) of float32;
    type t_out_mat is array(0 to n) of t_out_vec;

    function dotproduct (a : t_in_vec; b : t_in_vec) return float32;

    component matmult_dot_top is
        port(
                i_CLK       : in std_logic;
                i_RST       : in std_logic;
                i_A         : in t_in_mat;
                i_B         : in t_in_mat;
                o_C         : out t_out_mat
            );
    end component;
end package matmult_dot_pkg;


package body matmult_dot_pkg is
    function dotproduct (a : t_in_vec; b : t_in_vec) return float32 is
        variable res : float32 := (others =>'0');
        variable i : integer := 0;

        begin
            for i in 0 to a'length-1 loop
                res := res + (a(i)*b(i));
            end loop;
        return res;
    end dotproduct;
end matmult_dot_pkg;
