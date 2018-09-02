## PYNQ-Z1 Board Constraints for WireHigh.v
## Based on https://github.com/Digilent/digilent-xdc/blob/master/Arty-Master.xdc

##LED 0
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {Y}]
