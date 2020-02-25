force -freeze sim:/bsearch/start 1 0
force -freeze sim:/bsearch/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/bsearch/rst 1 0
force -freeze sim:/bsearch/rst 0 100
force -freeze sim:/bsearch/start 1 0
force -freeze sim:/bsearch/key 00000111 0
force -freeze sim:/bsearch/i 0000 0
force -freeze sim:/bsearch/j 1111 0