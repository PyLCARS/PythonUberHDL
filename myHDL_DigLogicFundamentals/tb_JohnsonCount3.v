module tb_JohnsonCount3;

reg [1:0] Dir;
wire [3:0] q;
reg clk;
reg rst;

initial begin
    $from_myhdl(
        Dir,
        clk,
        rst
    );
    $to_myhdl(
        q
    );
end

JohnsonCount3 dut(
    Dir,
    q,
    clk,
    rst
);

endmodule
