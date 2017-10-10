module tb_MultiplyBehavioral;

reg [2:0] x_1in;
reg [2:0] x_2in;
wire [8:0] P_out;

initial begin
    $from_myhdl(
        x_1in,
        x_2in
    );
    $to_myhdl(
        P_out
    );
end

MultiplyBehavioral dut(
    x_1in,
    x_2in,
    P_out
);

endmodule
