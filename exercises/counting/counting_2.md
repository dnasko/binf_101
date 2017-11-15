### Exercise 02

[GC content](https://en.wikipedia.org/wiki/GC-content) is a pretty simple thing to calculate from a FASTA file. Knowing the GC content of your sample, or of an organsim, can tell you a few things about the environment where it exists.

**Task:** Write a script that calculates the GC content `(G's + C’s) / sum(all_bases)` for the whole file **AND** prints out the number of each base type present in the whole file. So the output would look something like:

**Output:** Something like what's below:

```bash
GC_content = 0.378137
A = 19198945 (0.31176)
C = 11615498 (0.18862)
G = 11670960 (0.18952)
T = 19096676 (0.31010)
N = 20 (2.8e-8)
```

Those are made up numbers, but you know what I mean...

*Rev DJN 15Nov2017*
