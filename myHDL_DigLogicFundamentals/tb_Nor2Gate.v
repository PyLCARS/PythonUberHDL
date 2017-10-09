module tb_Nor2Gate;

reg x_1in;
reg x_2in;
wire y_out;

initial begin
    $from_myhdl(
        x_1in,
        x_2in
    );
    $to_myhdl(
        y_out
    );
end

Nor2Gate dut(
    x_1in,
    x_2in,
    y_out
);

endmodule
