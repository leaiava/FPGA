library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity RCF is
	generic(
        N_RCF: natural := 6    -- Cantidad de bits de addres de la memoria
    );
    port(
		clk_i :  in std_logic;
        I_i   :  in std_logic_vector(N_RCF-1 downto 0);
		I_o   : out std_logic_vector(N_RCF-1 downto 0);
        ena_i :  in std_logic
	);
end;

architecture RCF_arq of RCF is
 
begin

    process (clk_i)
        -- Se hace de un bit mas para evitar desborde al sobrepasar el límite
        variable addr_aux : integer range 0 to (2**(N_RCF+1)):=0;  
    begin
        if rising_edge(clk_i) then
            if ena_i = '1' then
                addr_aux := addr_aux + to_integer(unsigned(I_i));
                if addr_aux >= (2**N_RCF) then 
                    addr_aux := addr_aux -(2**N_RCF);
                end if;
                I_o <= std_logic_vector(to_unsigned(addr_aux,N_RCF));   
            end if;
        end if;
    end process;
    
end architecture;