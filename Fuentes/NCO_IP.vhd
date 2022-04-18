library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity NCO_IP is
    port(
		clk_i : in std_logic
	);
end;

architecture NCO_IP_arq of NCO_IP is
    component NCO is
        generic(
            N: natural := 8;    -- Bits de addres de la memoria
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
    
    COMPONENT vio_0
        PORT (
            clk : IN STD_LOGIC;
            probe_in0 : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
            probe_out0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            probe_out1 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            probe_out2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
            );
        END COMPONENT;
    
    COMPONENT ila_0
        PORT (
            clk : IN STD_LOGIC;
            probe0 : IN STD_LOGIC_VECTOR(9 DOWNTO 0)
            );
    END COMPONENT  ;
    
    signal out_probe: std_logic_vector(9 downto 0);
    signal I_probe  : std_logic_vector(7 downto 0);
    signal att_probe: std_logic_vector(2 downto 0);
    signal ena_probe: std_logic_vector(0 downto 0);

    begin
    
    NCO_inst: NCO
    port map(
        clk_i => clk_i,
        I_i   => I_probe,
        out_o => out_probe,
        att_i => att_probe,
        ena_i => ena_probe(0)
        );
    
    VIO_inst : vio_0
    PORT MAP (
        clk => clk_i,
        probe_in0 => out_probe,
        probe_out0 => I_probe,
        probe_out1 => att_probe,
        probe_out2 => ena_probe
        );
    
    ILA_inst : ila_0
    PORT MAP (
        clk => clk_i,
        probe0 => out_probe
        );
        
end architecture;
