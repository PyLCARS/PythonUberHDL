module tb_Down_Counter;

wire [4:0] count;
wire Trig;
reg clk;
reg rst;

initial begin
    $from_myhdl(
        clk,
        rst
    );
    $to_myhdl(
        count,
        Trig
    );
end

Down_Counter dut(
    count,
    Trig,
    clk,
    rst
);

endmodule
