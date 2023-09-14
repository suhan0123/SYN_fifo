cd /home/runner
export PATH=/usr/bin:/bin:/tool/pandora64/bin:/usr/share/questa/questasim//linux_x86_64
export CPLUS_INCLUDE_PATH=/usr/share/questa/questasim//interfaces/include
export QUESTA_HOME=/usr/share/questa/questasim/
export LM_LICENSE_FILE=1717@10.116.0.5
export HOME=/home/runner
export UVM_HOME=/playground_lib/uvm-1.2
vlib work && vlog -writetoplevels questa.tops '-timescale' '1ns/1ns' +incdir+$UVM_HOME/src -L $QUESTA_HOME/uvm-1.2 design.sv testbench.sv  && vsim -f questa.tops -batch -do "vsim -voptargs=+acc=npr; run -all; exit" -voptargs=+acc=npr ; echo 'Creating result.zip...' && zip -r /tmp/tmp_zip_file_123play.zip . && mv /tmp/tmp_zip_file_123play.zip result.zip