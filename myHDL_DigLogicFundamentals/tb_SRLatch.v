module tb_SRLatch;

reg S_in;
reg rst;
wire Q_out;
wire Qn_out;

initial begin
    $from_myhdl(
        S_in,
        rst
    );
    $to_myhdl(
        Q_out,
        Qn_out
    );
end

SRLatch dut(
    S_in,
    rst,
    Q_out,
    Qn_out
);

endmodule
