library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem_seno is
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
end;

architecture mem_seno_arq of mem_seno is
    
begin
	process (clk_i)
        -- Le doy un bit mas para evitar error por desborde
        variable address: integer range 0 to (2**(N_mem+1)); 
    begin
        if rising_edge(clk_i) then
            if ena_i = '1' then
                address := to_integer(unsigned(addr_i));
                
                if address >= (2**N_mem) then address := address -(2**N_mem);
                end if;

                if    address= 0 	then mem_out <= "0111111111";
                elsif address= 1 	then mem_out <= "1000001100";
                elsif address= 2 	then mem_out <= "1000011000";
                elsif address= 3 	then mem_out <= "1000100101";
                elsif address= 4 	then mem_out <= "1000110001";
                elsif address= 5 	then mem_out <= "1000111110";
                elsif address= 6 	then mem_out <= "1001001010";
                elsif address= 7 	then mem_out <= "1001010110";
                elsif address= 8 	then mem_out <= "1001100011";
                elsif address= 9 	then mem_out <= "1001101111";
                elsif address= 10 	then mem_out <= "1001111011";
                elsif address= 11 	then mem_out <= "1010000111";
                elsif address= 12 	then mem_out <= "1010010011";
                elsif address= 13 	then mem_out <= "1010011111";
                elsif address= 14 	then mem_out <= "1010101011";
                elsif address= 15 	then mem_out <= "1010110111";
                elsif address= 16 	then mem_out <= "1011000011";
                elsif address= 17 	then mem_out <= "1011001110";
                elsif address= 18 	then mem_out <= "1011011010";
                elsif address= 19 	then mem_out <= "1011100101";
                elsif address= 20 	then mem_out <= "1011110000";
                elsif address= 21 	then mem_out <= "1011111011";
                elsif address= 22 	then mem_out <= "1100000110";
                elsif address= 23 	then mem_out <= "1100010001";
                elsif address= 24 	then mem_out <= "1100011011";
                elsif address= 25 	then mem_out <= "1100100110";
                elsif address= 26 	then mem_out <= "1100110000";
                elsif address= 27 	then mem_out <= "1100111010";
                elsif address= 28 	then mem_out <= "1101000011";
                elsif address= 29 	then mem_out <= "1101001101";
                elsif address= 30 	then mem_out <= "1101010111";
                elsif address= 31 	then mem_out <= "1101100000";
                elsif address= 32 	then mem_out <= "1101101001";
                elsif address= 33 	then mem_out <= "1101110001";
                elsif address= 34 	then mem_out <= "1101111010";
                elsif address= 35 	then mem_out <= "1110000010";
                elsif address= 36 	then mem_out <= "1110001010";
                elsif address= 37 	then mem_out <= "1110010010";
                elsif address= 38 	then mem_out <= "1110011010";
                elsif address= 39 	then mem_out <= "1110100001";
                elsif address= 40 	then mem_out <= "1110101000";
                elsif address= 41 	then mem_out <= "1110101111";
                elsif address= 42 	then mem_out <= "1110110110";
                elsif address= 43 	then mem_out <= "1110111100";
                elsif address= 44 	then mem_out <= "1111000010";
                elsif address= 45 	then mem_out <= "1111001000";
                elsif address= 46 	then mem_out <= "1111001101";
                elsif address= 47 	then mem_out <= "1111010011";
                elsif address= 48 	then mem_out <= "1111011000";
                elsif address= 49 	then mem_out <= "1111011100";
                elsif address= 50 	then mem_out <= "1111100001";
                elsif address= 51 	then mem_out <= "1111100101";
                elsif address= 52 	then mem_out <= "1111101000";
                elsif address= 53 	then mem_out <= "1111101100";
                elsif address= 54 	then mem_out <= "1111101111";
                elsif address= 55 	then mem_out <= "1111110010";
                elsif address= 56 	then mem_out <= "1111110101";
                elsif address= 57 	then mem_out <= "1111110111";
                elsif address= 58 	then mem_out <= "1111111001";
                elsif address= 59 	then mem_out <= "1111111011";
                elsif address= 60 	then mem_out <= "1111111100";
                elsif address= 61 	then mem_out <= "1111111101";
                elsif address= 62 	then mem_out <= "1111111110";
                elsif address= 63 	then mem_out <= "1111111110";
                elsif address= 64 	then mem_out <= "1111111111";
                elsif address= 65 	then mem_out <= "1111111110";
                elsif address= 66 	then mem_out <= "1111111110";
                elsif address= 67 	then mem_out <= "1111111101";
                elsif address= 68 	then mem_out <= "1111111100";
                elsif address= 69 	then mem_out <= "1111111011";
                elsif address= 70 	then mem_out <= "1111111001";
                elsif address= 71 	then mem_out <= "1111110111";
                elsif address= 72 	then mem_out <= "1111110101";
                elsif address= 73 	then mem_out <= "1111110010";
                elsif address= 74 	then mem_out <= "1111101111";
                elsif address= 75 	then mem_out <= "1111101100";
                elsif address= 76 	then mem_out <= "1111101000";
                elsif address= 77 	then mem_out <= "1111100101";
                elsif address= 78 	then mem_out <= "1111100001";
                elsif address= 79 	then mem_out <= "1111011100";
                elsif address= 80 	then mem_out <= "1111011000";
                elsif address= 81 	then mem_out <= "1111010011";
                elsif address= 82 	then mem_out <= "1111001101";
                elsif address= 83 	then mem_out <= "1111001000";
                elsif address= 84 	then mem_out <= "1111000010";
                elsif address= 85 	then mem_out <= "1110111100";
                elsif address= 86 	then mem_out <= "1110110110";
                elsif address= 87 	then mem_out <= "1110101111";
                elsif address= 88 	then mem_out <= "1110101000";
                elsif address= 89 	then mem_out <= "1110100001";
                elsif address= 90 	then mem_out <= "1110011010";
                elsif address= 91 	then mem_out <= "1110010010";
                elsif address= 92 	then mem_out <= "1110001010";
                elsif address= 93 	then mem_out <= "1110000010";
                elsif address= 94 	then mem_out <= "1101111010";
                elsif address= 95 	then mem_out <= "1101110001";
                elsif address= 96 	then mem_out <= "1101101001";
                elsif address= 97 	then mem_out <= "1101100000";
                elsif address= 98 	then mem_out <= "1101010111";
                elsif address= 99 	then mem_out <= "1101001101";
                elsif address= 100 	then mem_out <= "1101000011";
                elsif address= 101 	then mem_out <= "1100111010";
                elsif address= 102 	then mem_out <= "1100110000";
                elsif address= 103 	then mem_out <= "1100100110";
                elsif address= 104 	then mem_out <= "1100011011";
                elsif address= 105 	then mem_out <= "1100010001";
                elsif address= 106 	then mem_out <= "1100000110";
                elsif address= 107 	then mem_out <= "1011111011";
                elsif address= 108 	then mem_out <= "1011110000";
                elsif address= 109 	then mem_out <= "1011100101";
                elsif address= 110 	then mem_out <= "1011011010";
                elsif address= 111 	then mem_out <= "1011001110";
                elsif address= 112 	then mem_out <= "1011000011";
                elsif address= 113 	then mem_out <= "1010110111";
                elsif address= 114 	then mem_out <= "1010101011";
                elsif address= 115 	then mem_out <= "1010011111";
                elsif address= 116 	then mem_out <= "1010010011";
                elsif address= 117 	then mem_out <= "1010000111";
                elsif address= 118 	then mem_out <= "1001111011";
                elsif address= 119 	then mem_out <= "1001101111";
                elsif address= 120 	then mem_out <= "1001100011";
                elsif address= 121 	then mem_out <= "1001010110";
                elsif address= 122 	then mem_out <= "1001001010";
                elsif address= 123 	then mem_out <= "1000111110";
                elsif address= 124 	then mem_out <= "1000110001";
                elsif address= 125 	then mem_out <= "1000100101";
                elsif address= 126 	then mem_out <= "1000011000";
                elsif address= 127 	then mem_out <= "1000001100";
                elsif address= 128 	then mem_out <= "0111111111";
                elsif address= 129 	then mem_out <= "0111110010";
                elsif address= 130 	then mem_out <= "0111100110";
                elsif address= 131 	then mem_out <= "0111011001";
                elsif address= 132 	then mem_out <= "0111001101";
                elsif address= 133 	then mem_out <= "0111000000";
                elsif address= 134 	then mem_out <= "0110110100";
                elsif address= 135 	then mem_out <= "0110101000";
                elsif address= 136 	then mem_out <= "0110011011";
                elsif address= 137 	then mem_out <= "0110001111";
                elsif address= 138 	then mem_out <= "0110000011";
                elsif address= 139 	then mem_out <= "0101110111";
                elsif address= 140 	then mem_out <= "0101101011";
                elsif address= 141 	then mem_out <= "0101011111";
                elsif address= 142 	then mem_out <= "0101010011";
                elsif address= 143 	then mem_out <= "0101000111";
                elsif address= 144 	then mem_out <= "0100111011";
                elsif address= 145 	then mem_out <= "0100110000";
                elsif address= 146 	then mem_out <= "0100100100";
                elsif address= 147 	then mem_out <= "0100011001";
                elsif address= 148 	then mem_out <= "0100001110";
                elsif address= 149 	then mem_out <= "0100000011";
                elsif address= 150 	then mem_out <= "0011111000";
                elsif address= 151 	then mem_out <= "0011101101";
                elsif address= 152 	then mem_out <= "0011100011";
                elsif address= 153 	then mem_out <= "0011011000";
                elsif address= 154 	then mem_out <= "0011001110";
                elsif address= 155 	then mem_out <= "0011000100";
                elsif address= 156 	then mem_out <= "0010111011";
                elsif address= 157 	then mem_out <= "0010110001";
                elsif address= 158 	then mem_out <= "0010100111";
                elsif address= 159 	then mem_out <= "0010011110";
                elsif address= 160 	then mem_out <= "0010010101";
                elsif address= 161 	then mem_out <= "0010001101";
                elsif address= 162 	then mem_out <= "0010000100";
                elsif address= 163 	then mem_out <= "0001111100";
                elsif address= 164 	then mem_out <= "0001110100";
                elsif address= 165 	then mem_out <= "0001101100";
                elsif address= 166 	then mem_out <= "0001100100";
                elsif address= 167 	then mem_out <= "0001011101";
                elsif address= 168 	then mem_out <= "0001010110";
                elsif address= 169 	then mem_out <= "0001001111";
                elsif address= 170 	then mem_out <= "0001001000";
                elsif address= 171 	then mem_out <= "0001000010";
                elsif address= 172 	then mem_out <= "0000111100";
                elsif address= 173 	then mem_out <= "0000110110";
                elsif address= 174 	then mem_out <= "0000110001";
                elsif address= 175 	then mem_out <= "0000101011";
                elsif address= 176 	then mem_out <= "0000100110";
                elsif address= 177 	then mem_out <= "0000100010";
                elsif address= 178 	then mem_out <= "0000011101";
                elsif address= 179 	then mem_out <= "0000011001";
                elsif address= 180 	then mem_out <= "0000010110";
                elsif address= 181 	then mem_out <= "0000010010";
                elsif address= 182 	then mem_out <= "0000001111";
                elsif address= 183 	then mem_out <= "0000001100";
                elsif address= 184 	then mem_out <= "0000001001";
                elsif address= 185 	then mem_out <= "0000000111";
                elsif address= 186 	then mem_out <= "0000000101";
                elsif address= 187 	then mem_out <= "0000000011";
                elsif address= 188 	then mem_out <= "0000000010";
                elsif address= 189 	then mem_out <= "0000000001";
                elsif address= 190 	then mem_out <= "0000000000";
                elsif address= 191 	then mem_out <= "0000000000";
                elsif address= 192 	then mem_out <= "0000000000";
                elsif address= 193 	then mem_out <= "0000000000";
                elsif address= 194 	then mem_out <= "0000000000";
                elsif address= 195 	then mem_out <= "0000000001";
                elsif address= 196 	then mem_out <= "0000000010";
                elsif address= 197 	then mem_out <= "0000000011";
                elsif address= 198 	then mem_out <= "0000000101";
                elsif address= 199 	then mem_out <= "0000000111";
                elsif address= 200 	then mem_out <= "0000001001";
                elsif address= 201 	then mem_out <= "0000001100";
                elsif address= 202 	then mem_out <= "0000001111";
                elsif address= 203 	then mem_out <= "0000010010";
                elsif address= 204 	then mem_out <= "0000010110";
                elsif address= 205 	then mem_out <= "0000011001";
                elsif address= 206 	then mem_out <= "0000011101";
                elsif address= 207 	then mem_out <= "0000100010";
                elsif address= 208 	then mem_out <= "0000100110";
                elsif address= 209 	then mem_out <= "0000101011";
                elsif address= 210 	then mem_out <= "0000110001";
                elsif address= 211 	then mem_out <= "0000110110";
                elsif address= 212 	then mem_out <= "0000111100";
                elsif address= 213 	then mem_out <= "0001000010";
                elsif address= 214 	then mem_out <= "0001001000";
                elsif address= 215 	then mem_out <= "0001001111";
                elsif address= 216 	then mem_out <= "0001010110";
                elsif address= 217 	then mem_out <= "0001011101";
                elsif address= 218 	then mem_out <= "0001100100";
                elsif address= 219 	then mem_out <= "0001101100";
                elsif address= 220 	then mem_out <= "0001110100";
                elsif address= 221 	then mem_out <= "0001111100";
                elsif address= 222 	then mem_out <= "0010000100";
                elsif address= 223 	then mem_out <= "0010001101";
                elsif address= 224 	then mem_out <= "0010010101";
                elsif address= 225 	then mem_out <= "0010011110";
                elsif address= 226 	then mem_out <= "0010100111";
                elsif address= 227 	then mem_out <= "0010110001";
                elsif address= 228 	then mem_out <= "0010111011";
                elsif address= 229 	then mem_out <= "0011000100";
                elsif address= 230 	then mem_out <= "0011001110";
                elsif address= 231 	then mem_out <= "0011011000";
                elsif address= 232 	then mem_out <= "0011100011";
                elsif address= 233 	then mem_out <= "0011101101";
                elsif address= 234 	then mem_out <= "0011111000";
                elsif address= 235 	then mem_out <= "0100000011";
                elsif address= 236 	then mem_out <= "0100001110";
                elsif address= 237 	then mem_out <= "0100011001";
                elsif address= 238 	then mem_out <= "0100100100";
                elsif address= 239 	then mem_out <= "0100110000";
                elsif address= 240 	then mem_out <= "0100111011";
                elsif address= 241 	then mem_out <= "0101000111";
                elsif address= 242 	then mem_out <= "0101010011";
                elsif address= 243 	then mem_out <= "0101011111";
                elsif address= 244 	then mem_out <= "0101101011";
                elsif address= 245 	then mem_out <= "0101110111";
                elsif address= 246 	then mem_out <= "0110000011";
                elsif address= 247 	then mem_out <= "0110001111";
                elsif address= 248 	then mem_out <= "0110011011";
                elsif address= 249 	then mem_out <= "0110101000";
                elsif address= 250 	then mem_out <= "0110110100";
                elsif address= 251 	then mem_out <= "0111000000";
                elsif address= 252 	then mem_out <= "0111001101";
                elsif address= 253 	then mem_out <= "0111011001";
                elsif address= 254 	then mem_out <= "0111100110";
                elsif address= 255 	then mem_out <= "0111110010";            
                elsif address>= (2**N_mem) then address := address -(2**N_mem);
                end if;
            end if;
        end if;
    end process;
end architecture;