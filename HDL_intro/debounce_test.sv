`timescale 1 us / 1 us


module debounce_test();
    logic clk;
    logic n_reset;
    logic button_in;
    logic DB_out;
 
    debounce UUT (button_in, clk, n_reset, DB_out);
 
 
    initial begin
            clk = 1'b0;
            n_reset = 1'b1;
            #20 n_reset = 1'b0;      // at time 20 release the reset
            button_in = 1'b1;
             
            // We need at least twice the counter value to stabilize value of DB_out
            // before we change the button in
            #50000 button_in = 1'b0; // We pressed the key here 
            #400 button_in = 1'b1; // Key debounce to 1 after 400 micro seconds             
            #800 button_in = 1'b0;    // Debounce after 800 ms
            #2000 button_in = 1'b1; // Decounce after 2 ms          
            #800 button_in = 1'b0;
            #40000 button_in = 1'b1;
            #4000 button_in = 1'b0;     
            #40000 button_in = 1'b1;
            #400 button_in = 1'b0;
            #800 button_in = 1'b1;      
            #800 button_in = 1'b0;
            #800 button_in = 1'b1;
            #40000 button_in = 1'b0;        
            #4000 button_in = 1'b1;
    end
    always
            #10 clk = ~clk;  // 20 mirco seconds = 50 KHz Clock cycle   
 
endmodule