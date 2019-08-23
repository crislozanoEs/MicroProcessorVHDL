library verilog;
use verilog.vl_types.all;
entity sistema_vlg_sample_tst is
    port(
        btn             : in     vl_logic;
        btn1            : in     vl_logic;
        clk             : in     vl_logic;
        data_in1        : in     vl_logic_vector(7 downto 0);
        data_in2        : in     vl_logic_vector(7 downto 0);
        int             : in     vl_logic;
        rst_n           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end sistema_vlg_sample_tst;
