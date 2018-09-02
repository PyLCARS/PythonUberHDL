## PYNQ-Z1 Board Constraints for BufferGate.v
## Based on https://github.com/Digilent/digilent-xdc/blob/master/Arty-Master.xdc


## Switch 0
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports {X}]


##LED 0
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {Y}]
