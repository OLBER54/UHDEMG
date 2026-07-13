transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+main  -L xil_defaultlib -L xpm -L xbip_utils_v3_0_15 -L mult_gen_v12_0_24 -L fifo_generator_v13_2_14 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.main xil_defaultlib.glbl

do {main.udo}

run 1000ns

endsim

quit -force
