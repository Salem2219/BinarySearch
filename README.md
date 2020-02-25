# Binary Search
Basic Finite State Machine with Datapath (FSMD) example to search for the value key(8 bits) in the nindecreaing array (rom) L[i],..,,L[j]. If key
is found, the program outputs an index k such that L[k] equals key. If key is not found, the program outputs notfound = '1'. i and j are 4 bits each.

## Note
L array is specified in rom_16x8bit.vhd.
## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem2219/BinarySearch.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd BinarySearch
    $ code .
    ```
    Click on the bsearch.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, if key = 20, i = 0, j = 15 then b = 9:

    ```sh
    $ vsim work.tb
    ```
