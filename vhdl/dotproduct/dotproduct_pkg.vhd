library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

library ieee_proposed;
use ieee_proposed.float_pkg.all;

package dotproduct_pkg is

    constant n : integer := 2;

    type t_in_vec is array (0 to n) of float32;
    type t_out_vec is array (0 to n) of float32;

    function dotproduct (a : t_in_vec; b : t_in_vec) return float32;

    component dotproduct_top is
        port(
                i_CLK       : in std_logic;
                i_RST       : in std_logic;
                i_A         : in t_in_vec;
                i_B         : in t_in_vec;
                o_C         : out float32
            );
    end component;
end package dotproduct_pkg;

package body dotproduct_pkg is

    function dotproduct (a : t_in_vec; b : t_in_vec) return float32 is
        variable res : float32 := (others =>'0');
        variable i : integer := 0;

        begin
            for i in 0 to a'length-1 loop
                res := res + (a(i)*b(i));
            end loop;
        return res;
    end dotproduct;
end dotproduct_pkg;
