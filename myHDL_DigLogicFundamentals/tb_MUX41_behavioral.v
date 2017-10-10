module tb_MUX41_behavioral;

reg sel_1;
reg sel_2;
reg x_1in;
reg x_2in;
reg x_3in;
reg x_4in;
wire f_out;

initial begin
    $from_myhdl(
        sel_1,
        sel_2,
        x_1in,
        x_2in,
        x_3in,
        x_4in
    );
    $to_myhdl(
        f_out
    );
end

MUX41_behavioral dut(
    sel_1,
    sel_2,
    x_1in,
    x_2in,
    x_3in,
    x_4in,
    f_out
);

endmodule
