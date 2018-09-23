## PYNQ-Z1 Constraint File for MUX2_1_Combo
## Based on https://github.com/Xilinx/PYNQ/blob/master/boards/Pynq-Z1/base/vivado/constraints/base.xdc


## Switches
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports {s}]; ##SW0

## Buttons
set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports {x0}]; ## BT0
set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS33} [get_ports {x1}]; ##BT1


## LEDs
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {y}]; ## Led 0


