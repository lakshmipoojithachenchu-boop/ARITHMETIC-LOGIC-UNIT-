// Module: alu
// Description: Basic ALU supporting ADD, SUB, AND, OR, and NOT operations.

module alu #(
    parameter WIDTH = 8 // Configurable data width
)(
    input  wire [WIDTH-1:0] a,      // Input Operand A
    input  wire [WIDTH-1:0] b,      // Input Operand B
    input  wire [2:0]       opcode, // 3-bit Operation Code
    output reg  [WIDTH-1:0] result, // ALU Result Output
    output reg              zero    // Zero Flag (1 if result is 0)
);

    // Opcode Definitions
    localparam ADD = 3'b000,
               SUB = 3'b001,
               AND = 3'b010,
               OR  = 3'b011,
               NOT = 3'b100;

    // Combinational Logic for ALU Operations
    always @(*) begin
        case (opcode)
            ADD:     result = a + b;
            SUB:     result = a - b;
            AND:     result = a & b;
            OR:      result = a | b;
            NOT:     result = ~a; // Performs bitwise NOT on Operand A
            default: result = {WIDTH{1'b0}}; // Default case safety
        endcase
    end

    // Combinational Logic for Zero Flag
    always @(*) begin
        if (result == {WIDTH{1'b0}})
            zero = 1'b1;
        else
            zero = 1'b0;
    end

endmodule
