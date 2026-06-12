module traffic_light_controller(
    input CLK,
    input RESET,
    output reg RED,
    output reg GREEN,
    output reg YELLOW
);

// State Encoding
parameter RED_STATE    = 2'b00;
parameter GREEN_STATE  = 2'b01;
parameter YELLOW_STATE = 2'b10;

reg [1:0] state;
reg [1:0] count;

// State Transition Logic
always @(posedge CLK or posedge RESET)
begin
    if (RESET)
    begin
        state <= RED_STATE;
        count <= 0;
    end
    else
    begin
        case(state)

            RED_STATE:
            begin
                if(count == 2)
                begin
                    state <= GREEN_STATE;
                    count <= 0;
                end
                else
                    count <= count + 1;
            end

            GREEN_STATE:
            begin
                if(count == 2)
                begin
                    state <= YELLOW_STATE;
                    count <= 0;
                end
                else
                    count <= count + 1;
            end

            YELLOW_STATE:
            begin
                if(count == 1)
                begin
                    state <= RED_STATE;
                    count <= 0;
                end
                else
                    count <= count + 1;
            end

        endcase
    end
end

// Output Logic
always @(*)
begin
    RED = 0;
    GREEN = 0;
    YELLOW = 0;

    case(state)

        RED_STATE:
            RED = 1;

        GREEN_STATE:
            GREEN = 1;

        YELLOW_STATE:
            YELLOW = 1;

    endcase
end

endmodulev