### Counting *k*-mers

A [*k*-mer](https://en.wikipedia.org/wiki/K-mer) is a substring of a sequence of length *k*. As the wiki says, the amount of *k*-mers possible given a string of length L is *L* - *k* + 1. Another thing to keep in midn is that given n character types in the string (4 in the case of DNA: A,T,G,C) there are *n*^*k* unique *k*-mers for that size *k*. Here are few examples:

* 1-mers = 4
* 2-mers = 16
* 3-mers = 64
* 4-mers = 256
* 31-mers = 4.6E18

*k*-mers are useful in bioinformatics as they provide a fast method for detecting signatures in the DNA and comparing DNA sequences to one another (more on that later).

**Task:** Write a script capable of counting all possible *k*-mers between 2-7, and let the user decide which *k*-mer to calculate.

**Output:** 2-column TSV file with the count in the left column and the *k*-mer in the right-column.
