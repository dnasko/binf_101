### Six-frame translation

When we're given a DNA FASTA file we usually aren't sure what [orientation the DNA is in](https://en.wikipedia.org/wiki/Directionality_(molecular_biology)). And on top of that, we don't know where to start when translating a sequence: The first base? Second? Third?

As a result there are alwyas six ways you can translate a DNA sequence. By translating a DNA sequence into all 6 peptide versions you *should* have created one correct peptide and five wrong peptides ([there are many exceptions though](https://en.wikipedia.org/wiki/Alternative_splicing)).

**Task:** Write a script that translates each DNA sequence in a FASTA file to all six possible translation types.

**Output:** A peptide FASTA file with all 6-frame translations for each DNA sequence.

*Rev DJN 16Nov2017*
