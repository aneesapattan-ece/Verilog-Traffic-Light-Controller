module testbench;

reg CLK;
reg RESET;

wire RED;
wire GREEN;
wire YELLOW;

traffic_light_controller uut(
    .CLK(CLK),
    .RESET(RESET),
    .RED(RED),
    .GREEN(GREEN),
    .YELLOW(YELLOW)
);

// Clock Generation
always #5 CLK = ~CLK;

initial
begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);

    CLK = 0;
    RESET = 1;

    // Keep reset active initially
    #10 RESET = 0;

    // Run simulation
    #200;

    $finish;
end

endmodule