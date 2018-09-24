## Switches
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports {s0}]; ##SW0
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS33} [get_ports {s1}]; ##SW1

## Buttons

set_property -dict {PACKAGE_PIN L19 IOSTANDARD LVCMOS33} [get_ports {x}]; ##BT3


## RGBLEDs
set_property -dict { PACKAGE_PIN L15   IOSTANDARD LVCMOS33 } [get_ports {y0}]; ##LD4_Blue
set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports {y1}]; ##LD4_Green
set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports {y2}]; ##LD5_Green
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports {y3}]; ##LD5_Red