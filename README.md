# FPGA hardware synthesizer #
Digital synthesizer implemented in Verilog for the DE0-Nano.


<h3>Plan</h3>
Create a full-fledged synthesizer with direct-digital sound generation with filters, LUT-based oscillators and simple polyphony.

<h3>HW</h3>
<4>Brains:</h4>Altera/Intel Terasic Cyclone IV EP4CE22F17C6N DE0 Nano FPGA board.
<h4>Rest:</h4>WIP

<h3>Conversion</h3>
Exploring the possibility of using a resistor-ladder filter implementation as the audio output stage instead of a traditional DAC. As the FPGA runs the GPIO in parallel 24 MHz core frequency, this is an interesting prospesct (no audio-range aliasing for instance).
