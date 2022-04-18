library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity NCO_tb is
end;

architecture NCO_tb_arq of NCO_tb is
    component NCO is
        generic(
            N: natural := 6;    -- Bits de addres de la memoria
            M: natural := 10;   -- Bits de la palabra de salida
            J: natural := 3     -- Bits de atenuacion
        );
        port(
            clk_i : in std_logic;
            I_i   : in std_logic_vector(N-1 downto 0);
            out_o : out std_logic_vector(M-1 downto 0);
            att_i  : in std_logic_vector(J-1 downto 0);
            ena_i  : in std_logic
        );
    end component;

    constant N_tb: natural:= 8;
    constant M_tb: natural:= 10;
    constant J_tb: natural:= 3;

    signal clk_i_tb : std_logic := '1';
    signal I_i_tb   : std_logic_vector(N_tb-1 downto 0) := std_logic_vector(to_unsigned(0,N_tb));
    signal out_o_tb : std_logic_vector(M_tb-1 downto 0);
    signal ena_i_tb : std_logic := '1';
    signal att_i_tb : std_logic_vector(J_tb-1 downto 0) := std_logic_vector(to_unsigned(1,j_tb));
begin

    clk_i_tb <= not clk_i_tb after 10 ns;
    ena_i_tb <= '0' after 16600 ns, '1' after 17330 ns,
                '0' after 30000 ns, '1' after 35000 ns;
    att_i_tb <= std_logic_vector(to_unsigned(2,j_tb)) after 24320 ns,
                std_logic_vector(to_unsigned(4,j_tb)) after 29440 ns;
    I_i_tb   <= std_logic_vector(to_unsigned(1,N_tb)) after 10240 ns,
                std_logic_vector(to_unsigned(6,N_tb)) after 15360 ns,
                std_logic_vector(to_unsigned(0,N_tb)) after 20480 ns;

    DUT: NCO
    generic map(
        N => N_tb,
        M => M_tb,
        J => J_tb
    )
    port map (
        clk_i => clk_i_tb,
        I_i   => I_i_tb,
        out_o => out_o_tb,
        att_i => att_i_tb,
        ena_i => ena_i_tb
    );

end architecture;
