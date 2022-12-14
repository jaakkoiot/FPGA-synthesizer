module SoundModule(
	input CLOCK_50,
	input MIDI_RX,
	output reg I2S_BIT_CLOCK,
	output reg I2S_SOUND_DATA,
	output reg I2S_LEFT_RIGHT_SELECT,
	output reg [7:0] LED,
	output reg [33:0] counter
);

wire i2sBitClock;
wire i2sSoundData;
wire i2sLeftRightSelect;

wire isNoteOn;
wire [23:0] noteSampleTicks;
wire [7:0] modulationValue;

MidiProcessor midiProcessor(CLOCK_50, MIDI_RX, isNoteOn, noteSampleTicks, modulationValue);
Synthesizer synthesizer(CLOCK_50, isNoteOn, noteSampleTicks, modulationValue, i2sBitClock, i2sSoundData, i2sLeftRightSelect);

always @(posedge CLOCK_50)
begin
	LED[0] <= counter[25];
	LED[1] <= counter[26]:
	LED[2] <= counter[27];
	LED[3] <= counter[28];
	LED[4] <= counter[29];
	LED[5] <= counter[30];
	LED[6] <= counter[31];
	LED[7] <= counter[32];
	counter <= counter + 1;
	I2S_BIT_CLOCK <= i2sBitClock;
	I2S_SOUND_DATA <= i2sSoundData;
	I2S_LEFT_RIGHT_SELECT <= i2sLeftRightSelect;
	
	//LED <= isNoteOn ? noteSampleTicks[7:0] : 8'h00;
end

endmodule
