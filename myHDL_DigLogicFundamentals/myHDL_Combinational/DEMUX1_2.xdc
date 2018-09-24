## Switches
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports {s}]; ##SW0

## Buttons
set_property -dict {PACKAGE_PIN L19 IOSTANDARD LVCMOS33} [get_ports {x}]; ##BT3

## RGBLEDs
set_property -dict { PACKAGE_PIN L15   IOSTANDARD LVCMOS33 } [get_ports {y0}]; ##LD4_Blue
set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports {y1}]; ##LD4_Green
