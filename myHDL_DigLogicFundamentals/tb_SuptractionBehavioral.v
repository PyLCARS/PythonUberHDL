module tb_SuptractionBehavioral;

reg [2:0] x_1in;
reg [2:0] x_2in;
wire [3:0] S_out;

initial begin
    $from_myhdl(
        x_1in,
        x_2in
    );
    $to_myhdl(
        S_out
    );
end

SuptractionBehavioral dut(
    x_1in,
    x_2in,
    S_out
);

endmodule
