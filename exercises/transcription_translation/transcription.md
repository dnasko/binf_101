### Transcription

Remember the [central dogma of molecular biology](https://en.wikipedia.org/wiki/Central_dogma_of_molecular_biology)? Of course you do! Well in this exercise we're going to bypass millions (billions?) of years of evolution and create our own way to [transcribe](https://en.wikipedia.org/wiki/Transcription_(biology)) DNA to RNA.

Recall, anytime we get sequencing results from a DNA sequencer it's always *DNA* that was sequenced (even in the csae of RNA-Seq, it's still DNA that was sequenced, even though really you're analyzing sequences that were once RNA). Fortunately you can write a script that turns your DNA into RNA pretty easily.

**Task:** Write a script that converts a DNA FASTA file into an RNA FASTA file.

**Output:** A FASTA file of RNA sequences corresponding to the input DNA FASTA file.

Remember transcription does not involve reverse complimentation. It's all about converting each base to its RNA compliment:

```bash
C -> G
G -> C
T -> A
A -> U
```

*Rev DJN 15Nov2017*
