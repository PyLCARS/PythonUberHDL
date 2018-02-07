module tb_jc2;

reg goLeft;
reg goRight;
reg stop;
reg clk;
wire [3:0] q;

initial begin
    $from_myhdl(
        goLeft,
        goRight,
        stop,
        clk
    );
    $to_myhdl(
        q
    );
end

jc2 dut(
    goLeft,
    goRight,
    stop,
    clk,
    q
);

endmodule
