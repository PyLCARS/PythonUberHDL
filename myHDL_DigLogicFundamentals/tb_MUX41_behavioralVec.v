module tb_MUX41_behavioralVec;

reg [1:0] sel;
reg [3:0] x_in;
wire f_out;

initial begin
    $from_myhdl(
        sel,
        x_in
    );
    $to_myhdl(
        f_out
    );
end

MUX41_behavioralVec dut(
    sel,
    x_in,
    f_out
);

endmodule
