module tb_DirControl;

reg [31:0] AXIin;
reg [1:0] SWITCHin;
wire goLeft_O;
wire goRight_O;
reg clk;

initial begin
    $from_myhdl(
        AXIin,
        SWITCHin,
        clk
    );
    $to_myhdl(
        goLeft_O,
        goRight_O
    );
end

DirControl dut(
    AXIin,
    SWITCHin,
    goLeft_O,
    goRight_O,
    clk
);

endmodule
