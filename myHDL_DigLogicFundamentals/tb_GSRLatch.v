module tb_GSRLatch;

reg S_in;
reg rst;
reg ena;
wire Q_out;
wire Qn_out;

initial begin
    $from_myhdl(
        S_in,
        rst,
        ena
    );
    $to_myhdl(
        Q_out,
        Qn_out
    );
end

GSRLatch dut(
    S_in,
    rst,
    ena,
    Q_out,
    Qn_out
);

endmodule
