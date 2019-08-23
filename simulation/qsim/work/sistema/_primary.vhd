library verilog;
use verilog.vl_types.all;
entity sistema is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        int             : in     vl_logic;
        data_in1        : in     vl_logic_vector(7 downto 0);
        data_in2        : in     vl_logic_vector(7 downto 0);
        btn             : in     vl_logic;
        btn1            : in     vl_logic;
        bus_data_out    : out    vl_logic_vector(7 downto 0);
        leds            : out    vl_logic_vector(15 downto 0)
    );
end sistema;
