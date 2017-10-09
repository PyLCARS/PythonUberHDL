module tb_Or3Gate;

reg x_1in;
reg x_2in;
reg x_3in;
wire y_out;

initial begin
    $from_myhdl(
        x_1in,
        x_2in,
        x_3in
    );
    $to_myhdl(
        y_out
    );
end

Or3Gate dut(
    x_1in,
    x_2in,
    x_3in,
    y_out
);

endmodule
