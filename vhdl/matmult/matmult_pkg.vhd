library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

package matmult_pkg is

    constant n : integer := 2;

    type t_in_col is array (0 to n) of std_logic_vector(15 downto 0);
    type t_in_mat is array(0 to n) of t_in_col;
    type t_out_col is array (0 to n) of std_logic_vector(31 downto 0);
    type t_out_mat is array(0 to n) of t_out_col;
    
    component matmult_core is
        port(
                i_CLK       : in std_logic;
                i_RST       : in std_logic;
                i_A         : in t_in_col;
                i_B         : in t_in_col;
                o_C         : out std_logic_vector (31 downto 0)
            );
    end component;
    
    component matmult_top is
        port(
                clk       : in std_logic;
                rst       : in std_logic;
                a         : in t_in_mat;
                b         : in t_in_mat;
                c         : out t_out_mat
            );
    end component;
end package matmult_pkg;