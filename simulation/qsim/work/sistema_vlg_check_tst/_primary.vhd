library verilog;
use verilog.vl_types.all;
entity sistema_vlg_check_tst is
    port(
        bus_data_out    : in     vl_logic_vector(7 downto 0);
        leds            : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end sistema_vlg_check_tst;
