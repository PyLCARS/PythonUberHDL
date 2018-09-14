## PYNQ-Z1 Constraint File for JohnsonCount3
## Based on https://github.com/Xilinx/PYNQ/blob/master/sdbuild/boot_configs/Pynq-Z1-defconfig/constraints.xdc


##Switches

set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports {Dir[0]}]; ##SW0
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS33} [get_ports {Dir[1]}]; ##SW1

##LEDs

set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {q[0]}]; ##LED0
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {q[1]}]; ##LED1
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {q[2]}]; ##LED2
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {q[3]}]; ##LED3

set_property -dict { PACKAGE_PIN D19   IOSTANDARD LVCMOS33 } [get_ports { rst }]; ##btn[0]
set_property -dict { PACKAGE_PIN L19   IOSTANDARD LVCMOS33 } [get_ports { clk }]; ##btn[3]
## Needed since if constraints even thinks a clock port is going to be connected to a non clock driver it wont synthize without it
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {clk}];
##should only be done for teaching and realy only on LOW (nearly none) jitter (Bouncy) sources 
