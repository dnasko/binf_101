# Unix Basics -- de novo Assembly

Two quick notes before we start: (1) Please write your answers to each question in the space where the *Answer* line is. (2) Always make sure you're writing in commands *exactly* as they appear in the code blocks. If you're running into an error then theres a >99% chance that it's a typo, or something silly. Becoming familiar with the command line take practice and a lot of mistakes. Learn from the mistakes and you're going to do great!

### Run the following commands on the UMIACS grid

Log on to your UMIACS account and begin to run through the following exercises. As usualy, each line inside a ```bash ... ``` block is (usually) a command that you can copy/paste and it should just work.

You're on the head node by default, and we're going to need to log on to an execution node to run this job.

```bash
srun --pty --qos=default --mem=4g --time=01:00:00 bash
```

This will put you on a machine where you can run computationally intensive jobs. And that's just what we're going to do! So in this exercise we're going to try to assemble the reads from your FASTQ file into the Flu A genome.

Remember, the FASTQ file contains the short pieces of DNA (technically RNA, but don't worry about that) from a bunch of Flu A viruses that a subject was infected with. We want to stitch these sequences together to see what the flu A genome of this subject looks like. There are already a bunch of programs and algorithms to do this, and you're going to install one now.

First we'll make a few directories:

```bash
mkdir -p bin
mkdir -p software
cd software
wget "http://cab.spbu.ru/files/release3.13.0/SPAdes-3.13.0-Linux.tar.gz"

```

Next we're going to download the SPAdes assembler and then unzip it and move the binaries in place so we can run the program:

```bash
wget "http://cab.spbu.ru/files/release3.13.0/SPAdes-3.13.0-Linux.tar.gz"
tar -xvf SPAdes-3.13.0-Linux.tar.gz
cd SPAdes-3.13.0-Linux
cd bin
./spades.py
```

You just ran the SPAdes assembler! By defualt when you run a program with no inputs/outputs it prints the help message to the screen and that's what you're looking at now. It's letting you know all of the various inputs, options, and flags that you can feed it.

*Question:* What is a '.py' file?

*Answer:* 

*Question:* If you open the `spades.py` file, what does the first line say?

*Answer:* 

Now we need to put these binaries in a place where your PATH can find them:

```bash
cd
cd bin
ln -s ../software/SPAdes-3.13.0-Linux/bin/* ./
cd
spades.py
```

When you run `spades.py` you should see the same error message you saw earlier. If this isn't working, take a break and email me with what's wrong because this needs to work for you to move on.

### Running the SPAdes assembler

Okay, so we're going to use a FASTQ file as the input and the SPAdes assembler will output a bunch of files for us, including a FASTA file of assembled reads (contigs).

First we need to copy a new FASTQ file to your data directory. This one is smaller and won't take as long to assembly as the one you were playing with earlier:

```bash
cp /cbcbhomes/dnasko/projects/teaching/data/165_3D_100K.fastq ~/data/fastq/
```

That will copy the FASTQ file in to the data/fastq/ folder in your home directory. Now let's run the assembly:

```bash
spades.py --only-assembler --threads 4 -s ~/data/fastq/165_3D_R1.fastq -o spades_out
```

This command will take a little while to run (at least 2 to 3 minutes), so feel free to grab some coffee while you wait.

When it's done go ahead and `cd` into the output directory (`cd spades_out`).

*Questions:*

1. How many contigs did the assembly produce (these are in the contigs.fasta file)?
2. How many base pairs are in the assembled contigs?
3. Knowing that these were influenza sequences how many contigs would you have expected the assembler to produce?

*Answers:*

1. 
2. 
3. 

### BLAST a contig

We haven't gone over BLAST (Basic local alignment search tool), but it's a program we use to search NT or AA sequences against one another. Take the first contig from the assembly and copy and paste it in the BLASTn web interface (https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastn&PAGE_TYPE=BlastSearch&LINK_LOC=blasthome) and see what sequences it matches.

*Question:* What organism and what gene does the first contig match in the BLASTn alignment?

*Answer:* 

### Exit

Be sure to end your interactive job:

```bash
exit
```

And then log off the cluster:

```bash
exit
```

_END_
