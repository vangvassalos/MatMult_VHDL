library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.matmult_pkg.all;

entity matmult_core is
    port (
        i_CLK       : in std_logic;
        i_RST       : in std_logic;
        i_A         : in t_in_col;
        i_B         : in t_in_col;
        o_C         : out std_logic_vector (31 downto 0)
        );
end matmult_core;

architecture behave of matmult_core is

    signal r_A      : t_in_col                  := (others => (others => '0'));
    signal r_B      : t_in_col                  := (others => (others => '0'));
    signal r_C      : unsigned(31 downto 0)     := (others => '0');
    
    signal r_CNT    : integer  range 0 to t_in_col'length+1;
    
begin

    p_RES : process (i_CLK) is
    begin
        if rising_edge(i_CLK) then
            r_C <= r_C + (unsigned(r_A(r_CNT))*unsigned(r_B(r_CNT)));
            r_CNT <= r_CNT + 1;
        end if;
        if r_CNT > t_in_col'length-1 then
            r_CNT <= 0;
            r_C <= (others => '0');
        end if;
        if i_RST = '1' then
            r_CNT <= 0;
            r_C <= (others => '0');
        end if;
    end process p_RES;

    r_A <= i_A;
    r_B <= i_B;
    o_C <= std_logic_vector(r_C);
end behave;
