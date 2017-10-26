module tb_DLatch;

reg D_in;
reg ena;
wire Q_out;
wire Qn_out;

initial begin
    $from_myhdl(
        D_in,
        ena
    );
    $to_myhdl(
        Q_out,
        Qn_out
    );
end

DLatch dut(
    D_in,
    ena,
    Q_out,
    Qn_out
);

endmodule
