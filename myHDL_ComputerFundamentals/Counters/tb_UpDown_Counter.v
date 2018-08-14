module tb_UpDown_Counter;

reg [0:0] Dir;
wire [4:0] count;
wire Trig;
reg clk;
reg rst;

initial begin
    $from_myhdl(
        Dir,
        clk,
        rst
    );
    $to_myhdl(
        count,
        Trig
    );
end

UpDown_Counter dut(
    Dir,
    count,
    Trig,
    clk,
    rst
);

endmodule
