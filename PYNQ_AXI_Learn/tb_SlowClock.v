module tb_SlowClock;

reg FastClk;
wire SlowClk;
reg rst;

initial begin
    $from_myhdl(
        FastClk,
        rst
    );
    $to_myhdl(
        SlowClk
    );
end

SlowClock dut(
    FastClk,
    SlowClk,
    rst
);

endmodule
