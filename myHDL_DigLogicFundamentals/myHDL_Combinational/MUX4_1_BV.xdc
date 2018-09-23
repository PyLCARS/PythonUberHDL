## PYNQ-Z1 Constraint File for MUX4_1_BV
## Based on https://github.com/Xilinx/PYNQ/blob/master/boards/Pynq-Z1/base/vivado/constraints/base.xdc


## Switches
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports {S[0]}]; ## SW0
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS33} [get_ports {S[1]}]; ## SW1

## Buttons
set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports {X[0]}]; ## BT0
set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS33} [get_ports {X[1]}]; ## BT1
set_property -dict {PACKAGE_PIN L20 IOSTANDARD LVCMOS33} [get_ports {X[2]}]; ## BT2
set_property -dict {PACKAGE_PIN L19 IOSTANDARD LVCMOS33} [get_ports {X[3]}]; ## BT3


## LEDs
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {y}]; ## Led 0


