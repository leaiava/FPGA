library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity NCO is
	generic(
        N: natural := 6;    -- Cantidad de bits de addres de la memoria
        M: natural := 10;   -- Cantidad de bits de la palabra de salida
        J: natural := 3     -- Cantidad de bits de atenuacion
    );
    port(
		clk_i : in std_logic;
        I_i   : in std_logic_vector(N-1 downto 0);
		out_o : out std_logic_vector(M-1 downto 0);
        att_i  : in std_logic_vector(J-1 downto 0);
        ena_i  : in std_logic
	);
end;

architecture NCO_arq of NCO is
    component mem_seno is
        generic(
            N_mem: natural := 4; -- numero de bits de address
            M_mem: natural := 10 -- numero de bits de datos de salida
        );
        port(
            clk_i   :  in std_logic;
            ena_i   :  in std_logic;
            addr_i  :  in std_logic_vector(N_mem-1 downto 0);
            mem_out : out std_logic_vector(M_mem-1 downto 0)
        );
    end component;
    
    component att is
        generic(
            N_att: natural := 3; -- numero de bits de atenuacion
            M_att: natural := 10 -- numero de bits de datos de salida
        );
        port(
            clk_i  : in std_logic; 
            ena_i  : in std_logic;
            att_i  : in std_logic_vector(N_att-1 downto 0);
            data_i : in std_logic_vector(M_att-1 downto 0);
            data_o : out std_logic_vector(M_att-1 downto 0)
        );
    end component;
    
    component RCF is
        generic(
            N_RCF: natural := 6    -- Cantidad de bits de addres de la memoria
        );
        port(
            clk_i :  in std_logic;
            I_i   :  in std_logic_vector(N_RCF-1 downto 0);
            I_o   : out std_logic_vector(N_RCF-1 downto 0);
            ena_i :  in std_logic
        );
    end component;

    signal data_aux : std_logic_vector(M-1 downto 0);
    signal I_aux    : std_logic_vector(N-1 downto 0);
begin
    
    -- instancio la memoria
    memoria_0: mem_seno
    generic map(
        N_mem => N,
        M_mem => M
    )
    port map(
        clk_i   => clk_i,
        ena_i   => ena_i,
        addr_i  => I_aux,
        mem_out => data_aux
    );
    -- instancio el atenuador
    att_0: att
    generic map(
        N_att => J,
        M_att => M
    )
    port map(
        clk_i  => clk_i,
        ena_i  => ena_i,
        att_i  => att_i,
        data_i => data_aux,
        data_o => out_o
    );
    -- instancio el RCF
    RCF_0: RCF
    generic map(
        N_RCF => N
    )
    port map(
        clk_i => clk_i,
        I_i   => I_i,
        I_o   => I_aux,
        ena_i => ena_i
    );

end architecture;