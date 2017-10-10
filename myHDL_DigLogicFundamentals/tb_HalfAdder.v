module tb_HalfAdder;

reg x_1in;
reg x_2in;
wire S_out;
wire C_out;

initial begin
    $from_myhdl(
        x_1in,
        x_2in
    );
    $to_myhdl(
        S_out,
        C_out
    );
end

HalfAdder dut(
    x_1in,
    x_2in,
    S_out,
    C_out
);

endmodule
