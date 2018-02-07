This is a tutorial (still in development) on how to create wite and simulate HDL code in Pythons' myHDL library. Then output the synthized Verilog (it can also output VHDL but that will not be done here) to Xilinx's Vivado to create an IP block for example usage on the Xilinx/Digilent PYNQ-Z1 Board to then control vis the Xilinx PYNQ FPGA wrapper. 

This tutorial will cover 
1.  Creating and synthesizing myHDL code to Verilog
2. importing the resulting Verilog code in the Vivado as well as setting up Vivado for working creating 'overlays' for the PYNQ-Z1
3. Create IP blocks in the Vivado IP block tools from the said Verilog code
4. create a block diagram program with the RTL and IP block and how to the execute the resulting synthesis to generate the bitstream and Tcl to load on the PYNQ-Z1
5. How to set up the PYNQ-Z1 SD Card from Linux and how to connect to the PYNQ-Z1 via USB
6. Load the overlay to the PYNQ-Z1 and write the Python PYNQ module on the board to then give commands to the FPGA fabric from python. 

The written tutorial is located in the Jupyter notebook [PYNQ_AXI_Learn_NB](https://github.com/PyLCARS/PythonUberHDL/blob/master/PYNQ_AXI_Learn/PYNQ_AXI_Learn_NB.ipynb) and the video  tutorial can be found [here(not yet available)]()
