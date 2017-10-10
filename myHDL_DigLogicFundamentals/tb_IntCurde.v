module tb_IntCurde;

reg [4:0] x_in;
wire [6:0] y_out;
reg clk;
reg rst;

initial begin
    $from_myhdl(
        x_in,
        clk,
        rst
    );
    $to_myhdl(
        y_out
    );
end

IntCurde dut(
    x_in,
    y_out,
    clk,
    rst
);

endmodule
