:: Compile Assembler
g++ assembler.cpp -o main

:: Run Assembler
main %1

:: Run ModelSim Do File
vsim -c -do "do Inetgration.do; quit -f"

::Run Python script
python Test.py %1

:: Draw Wave Form
vsim -do "vsim -view vsim.wlf; add wave -r *"