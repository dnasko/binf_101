#!/usr/bin/python
import sys

infile = sys.argv[1]

CodonTable = { "TTT":"F", "TTC":"F", "TTA":"L", "TTG":"L", "CTT":"L", "CTC":"L", "CTA":"L", "CTG":"L",
               "ATT":"I", "ATC":"I", "ATA":"I", "ATG":"M", "GTT":"V", "GTC":"V", "GTA":"V", "GTG":"V",
               "TCT":"S", "TCC":"S", "TCA":"S", "TCG":"S", "CCT":"P", "CCC":"P", "CCA":"P", "CCG":"P",
               "ACT":"T", "ACC":"T", "ACA":"T", "ACG":"T", "GCT":"A", "GCC":"A", "GCA":"A", "GCG":"A",
               "TAT":"Y", "TAC":"Y", "TAA":"*", "TAG":"*", "CAT":"H", "CAC":"H", "CAA":"Q", "CAG":"Q",
               "AAT":"N", "AAC":"N", "AAA":"K", "AAG":"K", "GAT":"D", "GAC":"D", "GAA":"E", "GAG":"E",
               "TGT":"C", "TGC":"C", "TGA":"*", "TGG":"W", "CGT":"R", "CGC":"R", "CGA":"R", "CGG":"R",
               "AGT":"S", "AGC":"S", "AGA":"R", "AGG":"R", "GGT":"G", "GGC":"G", "GGA":"G", "GGG":"G" }

file = open(infile, "r")
for line in file:
    if line[0] == '>':
        print line.rstrip()
    else:
        aa = ""
        for i in range(0, len(line.rstrip()), 3):
            codon = line.rstrip().upper()[i:i+3]
            if len(codon) == 3:
                if codon in CodonTable:
                    aa += CodonTable[codon]
                else:
                    aa += "X"
        print aa
file.close()

exit(0)
