module tb_ClockDivider;

reg [31:0] Divisor;
wire clkOut;
wire [31:0] count;
reg clk;
reg rst;

initial begin
    $from_myhdl(
        Divisor,
        clk,
        rst
    );
    $to_myhdl(
        clkOut,
        count
    );
end

ClockDivider dut(
    Divisor,
    clkOut,
    count,
    clk,
    rst
);

endmodule
