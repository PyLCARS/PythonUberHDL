## PYNQ-Z1 Board Constraints for OrGate.v
## Based on https://github.com/Digilent/digilent-xdc/blob/master/Arty-Master.xdc


## Switchs 0,1
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports {X0}]
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS33} [get_ports {X1}]


##LED 0
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {Y}]
