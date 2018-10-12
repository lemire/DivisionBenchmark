# DivisionBenchmark
A not-so-exciting benchmark to measure the performance of some division functions


## Requirements

- A bash shell
- A GCC-like C compiler callable with `cc`, it should support conventional flags like  `-march=native -O3`
- The tool `make` to build C programs (nice to have but not strictly necessary)
- A `time` command which reports how long a program runs (required)
- An `objdump` tool that dumps the assembly corresponding to a compiled binary  (nice to have but not strictly necessary)
- The `find` and  `cat` command (nice to have)

The benchmark may still work if some of these requirements are missing, but the C compiler is a strict requirement.

## How to use

- The tests are many and they are not exactly cheap. They may run for a long time.  However, they require little memory and they are single-threaded. It is best if you can somehow lock the process to a single core.
- While in the `DivisionBenchmark` directory run the script `runme.sh` and collect the output (e.g.,  `runme.sh > mylogfile.txt`). The output could be quite large, so do not expect to be able to copy and paste it conveniently.

It might be as easy as doing the following:

```
git clone https://github.com/lemire/DivisionBenchmark.git
cd DivisionBenchmark
./runme.sh > mylogfile.txt
# send back mylogfile.txt
```

