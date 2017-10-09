module tb_SinGenerator;

wire [30:0] SinValue_out;
reg clk;
reg rst;
reg ena;

initial begin
    $from_myhdl(
        clk,
        rst,
        ena
    );
    $to_myhdl(
        SinValue_out
    );
end

SinGenerator dut(
    SinValue_out,
    clk,
    rst,
    ena
);

endmodule
