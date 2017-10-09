module tb_NotGate;

reg x_in;
wire y_out;

initial begin
    $from_myhdl(
        x_in
    );
    $to_myhdl(
        y_out
    );
end

NotGate dut(
    x_in,
    y_out
);

endmodule
