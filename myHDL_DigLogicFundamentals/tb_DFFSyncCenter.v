module tb_DFFSyncCenter;

reg D_in;
wire Q_out;
wire Qn_out;
reg clk;

initial begin
    $from_myhdl(
        D_in,
        clk
    );
    $to_myhdl(
        Q_out,
        Qn_out
    );
end

DFFSyncCenter dut(
    D_in,
    Q_out,
    Qn_out,
    clk
);

endmodule
