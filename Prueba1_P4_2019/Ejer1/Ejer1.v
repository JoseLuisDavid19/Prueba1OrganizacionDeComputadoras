module Ejer1(
    input [5:0] opc, //! Opcode
    input [5:0] func, //! Function
    output reg isJmp, //! Jump signal
    output reg isBeq, //! BEQ signal
    output reg isBne, //! BNE signal
    output reg [1:0] rfWriteDataSel, //! Register File Write Data Select
    output reg rfWriteAddrSel, //! Register File Write Address Select
    output reg rfWriteEnable, //! Register Write Enable
    output reg memWrite, //! Memory Write
    output reg memRead, //! Memory Read
    output reg aluSrc, //! ALU source
    output reg [2:0] aluFunc, //! ALU operation
    output reg bitXtend, //! Bit extension, 0 = sign extend, 1 = zero extend
    output reg invOpcode //! Invalid opcode or function
);
  //TODO: Implement control signals for OR, LW and BEQ

always @(*) begin
    isJmp=1'bx; //! Jump signal
    isBeq=1'bx; //! BEQ signal
    isBne=1'bx; //! BNE signal
    rfWriteDataSel=2'bx; //! Register File Write Data Select
    rfWriteAddrSel=1'bx; //! Register File Write Address Select
    rfWriteEnable=1'bx; //! Register Write Enable
    memWrite=1'bx; //! Memory Write
    memRead=1'bx; //! Memory Read
    aluSrc=1'bx; //! ALU source
    aluFunc=3'bx; //! ALU operation
    bitXtend=1'bx; //! Bit extension, 0 = sign extend, 1 = zero extend
invOpcode=1'bx;
  case (opc)
    6'b0: begin 
          case(func)
                6'h25: begin 
                          rfWriteEnable=1'b1;
                          rfWriteAddrSel=1'b1;
                          aluFunc=3'b100;
                          aluSrc=1'b0;
                        end
                default: begin
                  isJmp=1'bx; //! Jump signal
                  isBeq=1'bx; //! BEQ signal
                  isBne=1'bx; //! BNE signal
                  rfWriteDataSel=2'bx; //! Register File Write Data Select
                  rfWriteAddrSel=1'bx; //! Register File Write Address Select
                  rfWriteEnable=1'bx; //! Register Write Enable
                  memWrite=1'bx; //! Memory Write
                  memRead=1'bx; //! Memory Read
                  aluSrc=1'bx; //! ALU source
                  aluFunc=3'bx; //! ALU operation
                  bitXtend=1'bx;
                  invOpcode=1'bx; //! Invalid opcode or function
                end
          endcase
        end


    6'h23: begin
        rfWriteEnable=1'b1;
        aluFunc=3'b001;
        aluSrc=1'b0;
        memRead=1'b1;
        rfWriteDataSel=2'd1;
     end   

    6'h23: begin
        rfWriteEnable=1'b1;
        aluFunc=3'b001;
        aluSrc=1'b0;
        memRead=1'b1;
        rfWriteDataSel=2'd1;
     end   

     6'h04: begin 
        aluFunc=3'b001;
        aluSrc=1'b0;
        bitXtend=1'b1;
        BEQ=1'b1;  
     end  
    default: begin
    isJmp=1'bx; //! Jump signal
    isBeq=1'bx; //! BEQ signal
    isBne=1'bx; //! BNE signal
    rfWriteDataSel=2'bx; //! Register File Write Data Select
    rfWriteAddrSel=1'bx; //! Register File Write Address Select
    rfWriteEnable=1'bx; //! Register Write Enable
    memWrite=1'bx; //! Memory Write
    memRead=1'bx; //! Memory Read
    aluSrc=1'bx; //! ALU source
    aluFunc=3'bx; //! ALU operation
    bitXtend=1'bx;
    invOpcode=1'bx;
    end

  endcase

end

endmodule
