/* This is a Verilog template for use with the BeMicro MAX 10 development kit */
/* It is used for showing the IO pin names and directions                     */
/* Ver 0.2 10.07.2014                                                         */

/* NOTE: A VHDL version of this template is also provided with this design    */
/* example for users that prefer VHDL. This BeMicro_MAX10_top.v file would    */
/* need to be removed from the project and replaced with the                  */
/* BeMicro_MAX10_top.vhd file to switch to the VHDL template.                 */

/* The signals below are documented in the "BeMicro MAX 10 Getting Started    */
/* User Guide."  Please refer to that document for additional signal details. */

`define ENABLE_CLOCK_INPUTS
//`define ENABLE_DAC_SPI_INTERFACE
//`define ENABLE_TEMP_SENSOR
//`define ENABLE_ACCELEROMETER
//`define ENABLE_SDRAM
//`define ENABLE_SPI_FLASH
//`define ENABLE_MAX10_ANALOG
`define ENABLE_PUSHBUTTON
`define ENABLE_LED_OUTPUT
//`define ENABLE_EDGE_CONNECTOR
`define ENABLE_HEADERS
`define ENABLE_GPIO_J3
`define ENABLE_GPIO_J4
`define ENABLE_PMOD
`define ENABLE_CHIPSCOPE
`define ENABLE_FTDI_245

module BeMicro_MAX10_top (

	/* Clock inputs, SYS_CLK = 50MHz, USER_CLK = 24MHz */	
`ifdef ENABLE_CLOCK_INPUTS
	//Voltage Level 2.5V
	input SYS_CLK,
	input USER_CLK,
`endif

`ifdef	ENABLE_DAC_SPI_INTERFACE
	/* DAC, 12-bit, SPI interface (AD5681) */
	output AD5681R_LDACn,
	output AD5681R_RSTn,
	output AD5681R_SCL,
	output AD5681R_SDA,
	output AD5681R_SYNCn,
`endif	

`ifdef ENABLE_TEMP_SENSOR 
	/* Temperature sensor, I2C interface (ADT7420) */
	// Voltage Level 2.5V 
	input ADT7420_CT,		
	input ADT7420_INT,		
	inout ADT7420_SCL,		
	inout ADT7420_SDA,
`endif

`ifdef ENABLE_ACCELEROMETER	
	/* Accelerometer, 3-Axis, SPI interface (ADXL362)*/
	// Voltage Level 2.5V
	output ADXL362_CS,
	input ADXL362_INT1,
	input ADXL362_INT2,
	input ADXL362_MISO,
	output ADXL362_MOSI,
	output ADXL362_SCLK,
`endif	

`ifdef ENABLE_SDRAM
	/* 8MB SDRAM, ISSI IS42S16400J-7TL SDRAM device */
	// Voltage Level 2.5V
	output [12:0] SDRAM_A,
	output [1:0] SDRAM_BA,
	output SDRAM_CASn,
	output SDRAM_CKE,
	output SDRAM_CLK,
	output SDRAM_CSn,
	inout [15:0] SDRAM_DQ,
	output SDRAM_DQMH,
	output SDRAM_DQML,
	output SDRAM_RASn,
	output SDRAM_WEn,
`endif

`ifdef ENABLE_SPI_FLASH	
	/* Serial SPI Flash, 16Mbit, Micron M25P16-VMN6 */
	// Voltage Level 2.5V
	input SFLASH_ASDI,
	input SFLASH_CSn,
	inout SFLASH_DATA,
	inout SFLASH_DCLK,
`endif	

`ifdef ENABLE_MAX10_ANALOG
	/* MAX10 analog inputs */
	// Voltage Level 2.5V
	input [7:0] AIN,
`endif

`ifdef ENABLE_PUSHBUTTON	
	/* pushbutton switch inputs */
	// Voltage Level 2.5V 
	input [4:1] PB,
`endif	

`ifdef ENABLE_LED_OUTPUT
	/* LED outputs */
	// Voltage Level 2.5V
	output [8:1] USER_LED,
`endif	

`ifdef ENABLE_EDGE_CONNECTOR
	/* BeMicro 80-pin Edge Connector */ 
	// Voltafe Level 2.5V
	inout EG_P1,
	inout EG_P10,
	inout EG_P11,
	inout EG_P12,
	inout EG_P13,
	inout EG_P14,
	inout EG_P15,
	inout EG_P16,
	inout EG_P17,
	inout EG_P18,
	inout EG_P19,
	inout EG_P2,
	inout EG_P20,
	inout EG_P21,
	inout EG_P22,
	inout EG_P23,
	inout EG_P24,
	inout EG_P25,
	inout EG_P26,
	inout EG_P27,
	inout EG_P28,
	inout EG_P29,
	inout EG_P3,
	inout EG_P35,
	inout EG_P36,
	inout EG_P37,
	inout EG_P38,
	inout EG_P39,
	inout EG_P4,
	inout EG_P40,
	inout EG_P41,
	inout EG_P42,
	inout EG_P43,
	inout EG_P44,
	inout EG_P45,
	inout EG_P46,
	inout EG_P47,
	inout EG_P48,
	inout EG_P49,
	inout EG_P5,
	inout EG_P50,
	inout EG_P51,
	inout EG_P52,
	inout EG_P53,
	inout EG_P54,
	inout EG_P55,
	inout EG_P56,
	inout EG_P57,
	inout EG_P58,
	inout EG_P59,
	inout EG_P6,
	inout EG_P60,
	inout EG_P7,
	inout EG_P8,
	inout EG_P9,
	input EXP_PRESENT,
	output RESET_EXPn,
`endif

`ifdef ENABLE_HEADERS	
	/* Expansion headers (pair of 40-pin headers) */
	// Voltage Level 2.5V
	inout GPIO_01,
	inout GPIO_02,
	inout GPIO_03,
	inout GPIO_04,
	inout GPIO_05,
	inout GPIO_06,
	inout GPIO_07,
	inout GPIO_08,
	inout GPIO_09,
	inout GPIO_10,
	inout GPIO_11,
	inout GPIO_12,
	inout GPIO_A,
	inout GPIO_B,
	inout I2C_SCL,
	inout I2C_SDA,
`endif

`ifdef ENABLE_GPIO_J3
	//The following group of GPIO_J3_* signals can be used as differential pair 
	//receivers as defined by some of the Terasic daughter card that are compatible 
	//with the pair of 40-pin expansion headers. To use the differential pairs, 
	//there are guidelines regarding neighboring pins that must be followed.  
	//Please refer to the "Using LVDS on the BeMicro MAX 10" document for details.
	// Voltage Level 2.5V
	inout GPIO_J3_15,
	inout GPIO_J3_16,
	inout GPIO_J3_17, //VGA_BLUE
	inout GPIO_J3_18,
	inout GPIO_J3_19,
	inout GPIO_J3_20,
	/*
	inout GPIO_J3_23,	// SIWU#
	inout GPIO_J3_24,	// D0
	inout GPIO_J3_25,	// D2
	inout GPIO_J3_26, // RESET#
	inout GPIO_J3_27, // D1
	inout GPIO_J3_28, // D5		<--  D2 ?
	inout GPIO_J3_31, // TXF#
	inout GPIO_J3_32, // D7
	inout GPIO_J3_33, // D4
	inout GPIO_J3_34, // D6
	inout GPIO_J3_35, // D3		<-- 
	inout GPIO_J3_36, // RXF#
	inout GPIO_J3_37, // OE#
	inout GPIO_J3_38, // RD#
	inout GPIO_J3_39, // CLK
	inout GPIO_J3_40, // WR#
	*/
	inout GPIO_J3_21,	//D7
	inout GPIO_J3_22,
	inout GPIO_J3_23,	//D6
	inout GPIO_J3_24,
	inout GPIO_J3_25,	//D5
	inout GPIO_J3_26,
	inout GPIO_J3_27,	//D4
	inout GPIO_J3_28,
	inout GPIO_J3_31,	//XX
	inout GPIO_J3_32,
	inout GPIO_J3_33,	//D3
	inout GPIO_J3_34,
	inout GPIO_J3_35,	//D2
	inout GPIO_J3_36,
	inout GPIO_J3_37,	//D1
	inout GPIO_J3_38,
	inout GPIO_J3_39,	//D0
	inout GPIO_J3_40,

`endif

`ifdef ENABLE_GPIO_J4
	//The following group of GPIO_J4_* signals can be used as true LVDS transmitters 
	//as defined by some of the Terasic daughter card that are compatible 
	//with the pair of 40-pin expansion headers. To use the differential pairs, 
	//there are guidelines regarding neighboring pins that must be followed.  
	//Please refer to the "Using LVDS on the BeMicro MAX 10" document for details.
	// Voltage Level 2.5V 
	inout GPIO_J4_11,
	inout GPIO_J4_12,
	inout GPIO_J4_13,
	inout GPIO_J4_14,
	inout GPIO_J4_15, 
	inout GPIO_J4_16, 
	inout GPIO_J4_19,
	inout GPIO_J4_20,
	inout GPIO_J4_21,
	inout GPIO_J4_22, 
	inout GPIO_J4_23,
	inout GPIO_J4_24, //C1
	inout GPIO_J4_27,
	inout GPIO_J4_28, //C2
	inout GPIO_J4_29,
	inout GPIO_J4_30, //C3
	inout GPIO_J4_31,
	inout GPIO_J4_32, //C4
	inout GPIO_J4_35,
	inout GPIO_J4_36, //C5
	inout GPIO_J4_37,
	inout GPIO_J4_38, //C6
	inout GPIO_J4_39,
	inout GPIO_J4_40, //C7
`endif

`ifdef ENABLE_PMOD	
	/* PMOD connectors */
	//Voltage Level 2.5V
	inout [3:0] PMOD_A,
	inout [3:0] PMOD_B,
	inout [3:0] PMOD_C,
	inout [3:0] PMOD_D
`endif

);

`ifdef ENABLE_FTDI_245
	// INPUTS
	`define FTDI_CLK_60 GPIO_J4_35
	/* When high, do not read data from the FIFO. When low, there is data available in the FIFO which can be read by driving RD# low. 
		When in synchronous mode, data is transferred on every clock that RXF# and RD# are both low. 
		Note that the OE# pin must be driven low at least 1 clock period before asserting RD# low. */
	`define FTDI_RXF_N GPIO_J4_21
	/* When high, do not write data into the FIFO. When low, data can be written into the FIFO by driving WR# low. 
		When in synchronous mode, data is transferred on every clock that TXE# and WR# are both low. */
	`define FTDI_TXE_N GPIO_J4_23
	// OUTPUTS
	`define FTDI_RD_N GPIO_J4_27
	`define FTDI_WR_N GPIO_J4_29
	/* Output enable when low to drive data onto D0-7. This should be driven low at 
		least 1 clock period before driving RD# low to allow for data buffer turn-around */
	`define FTDI_OE_N GPIO_J4_37
	// not used in functional flow
	`define FTDI_SIWU_N GPIO_J4_31
	`define FTDI_PDN_N GPIO_J4_39
	
	`define FTDI_DATA { GPIO_J3_21, GPIO_J3_23, GPIO_J3_25, GPIO_J3_27, GPIO_J3_33, GPIO_J3_35, GPIO_J3_37, GPIO_J3_39 }
`endif

`ifdef ENABLE_CHIPSCOPE
	`define DEBUG_LO { GPIO_08, GPIO_07, GPIO_06,    GPIO_05,    GPIO_04,    GPIO_03,    GPIO_02, GPIO_01 }
	`define DEBUG_HI { GPIO_11, GPIO_12, GPIO_J4_13, GPIO_J4_14, GPIO_J4_11, GPIO_J4_12, GPIO_10, GPIO_09 }
`endif

`ifdef ENABLE_CHIPSCOPE
	wire [15:0] DEBUG; assign {`DEBUG_HI,`DEBUG_LO} = DEBUG[15:0];
`endif
 
`ifdef ENABLE_FTDI_245	
	assign `FTDI_SIWU_N = 1'b1;
	assign `FTDI_PDN_N  = 1'b1;
`endif

ftdi_loopback 
	Q0
		(
			.FTDI_CLK_60(`FTDI_CLK_60),
			.FTDI_RXF_N (`FTDI_RXF_N),
			.FTDI_TXE_N (`FTDI_TXE_N),
			.FTDI_WR_N  (`FTDI_WR_N),
			.FTDI_RD_N  (`FTDI_RD_N),
			.FTDI_OE_N  (`FTDI_OE_N),
			.FTDI_DATA  (`FTDI_DATA),
			.RESET_N		(reset_n),
			.DEBUG		()//DEBUG)
		);

//  VGA SECTION
// From eater.net.  Wants a 10MHz clock.
pll
	pll0
		(
			.inclk0(SYS_CLK), //50MHz
			.c0(vgaclk) // 10MHz
		);
//


wire [1:0] VGA_RED;
wire [1:0] VGA_GRN;
wire [1:0] VGA_BLU;

assign VGA_BLU[1:0] = (blank) ? 2'b00 : rgb_val[1:0]; 
assign VGA_GRN[1:0] = (blank) ? 2'b00 : rgb_val[3:2]; 
assign VGA_RED[1:0] = (blank) ? 2'b00 : rgb_val[5:4]; 

assign PMOD_A[3:0] = { vsync, hsync, VGA_BLU[1:0] };
assign PMOD_D[3:0] = { VGA_RED[1:0], VGA_GRN[1:0] };

wire [5:0] rgb_val;
wire hsync,vsync,vblank,hblank,blank;
wire [9:0] y_counter;
wire [7:0] x_counter;
assign blank = (vblank|hblank);
horizontal_generator 
	vga_horizontal
		( 
			.clk(vgaclk),
			.reset_n(reset_n),
			.hsync(hsync),
			.hblank(hblank),
			.x_counter(x_counter)
		);
vertical_generator
	vga_vertical
		(
			.clk(hblank),
			.reset_n(reset_n),
			.vsync(vsync),
			.vblank(vblank),
			.y_counter(y_counter)
		);
// END VGA SECTION		
		
wire [13:0] rom_address; // 14-bits of address
assign rom_address = {y_counter[9:3], x_counter[7:1]}; // 7 + 7
reg vga_clk_b; always @(posedge vgaclk) vga_clk_b <= ~vga_clk_b;
assign DEBUG[3:0]  = {1'b0, blank, reset_n, vga_clk_b};
assign DEBUG[7:4]  = {vblank, hblank, vsync, hsync};
assign DEBUG[15:8] = rom_address[7:0];	

finch 
	vga_rom
		(
			.address(rom_address),
			.clock(vgaclk),
			.q(rgb_val)
		);
//
	
/* Design level reset */
parameter SYS_CLK_FREQ = 'd50_000_000;
wire reset,reset_n;assign reset = ~reset_n;assign reset_n = user_reset_cpl;
reg [25:0] user_reset_cntr;reg [0:0] user_reset_cpl;
wire user_reset_button; assign user_reset_button = ~PB[1];
wire user_debug_counter; assign user_debug_counter = ~PB[2];

always @(posedge SYS_CLK or posedge user_reset_button) begin
	if(user_reset_button) begin
		user_reset_cntr <= 0;
		user_reset_cpl  <= 0;
	end 
	else begin
		if(user_reset_cntr == SYS_CLK_FREQ/1000) begin
			user_reset_cpl <= 1;
		end else begin
			user_reset_cntr <= user_reset_cntr + 1'b1;
			user_reset_cpl <= 0;
		end
	end
end

/* LED SWAPPING and assigns */
reg [7:0] led_o; assign USER_LED[8:1] = ~led_o;
always @* begin
	led_o[7]= reset_n;
	led_o[6]= 1'b0;
	led_o[5]= 1'b0;
	led_o[4]= 1'b0;
	led_o[3]= 1'b0;
	led_o[2]= 1'b0;
	led_o[1]= 1'b0;
	led_o[0]= 1'b0;
end


endmodule
