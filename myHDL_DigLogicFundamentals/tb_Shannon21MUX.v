module tb_Shannon21MUX;

reg s1;
reg s2;
reg w_3in;
wire f_out;

initial begin
    $from_myhdl(
        s1,
        s2,
        w_3in
    );
    $to_myhdl(
        f_out
    );
end

Shannon21MUX dut(
    s1,
    s2,
    w_3in,
    f_out
);

endmodule
