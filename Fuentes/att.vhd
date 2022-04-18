library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity att is
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
end;

architecture att_arq of att is
    
begin
	process (clk_i)
        variable att_aux: integer range 0 to 2**N_att;
        variable data_aux: integer range 0 to 2**M_att;
    begin
        att_aux := to_integer(unsigned(att_i));
        data_aux := to_integer(unsigned(data_i));

        if rising_edge(clk_i) then
            if ena_i = '1' and att_aux/=0 then
                data_aux := data_aux / att_aux;
                data_o <= std_logic_vector(to_unsigned(data_aux,M_att));
            else
                data_o <= std_logic_vector(to_unsigned(0,M_att));
            end if;
        end if;

    end process;
end architecture;