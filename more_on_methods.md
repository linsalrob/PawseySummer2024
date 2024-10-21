# More on methods

## Simulating mock metagenomes with segmented viruses

1. Pick some reference genomes of segmented viruses.
2. Assign different coverage values to them.
3. Use those coverage values and simulate reads using a read simulator like [InSilicoSeq](https://insilicoseq.readthedocs.io/). You can use the MiSeq model.
4. Assemble the reads using a metagenome assembler like [metaSPAdes](https://github.com/ablab/spades) or [MEGAHIT](https://github.com/voutcn/megahit) to obtain contigs.
5. Map the contigs to the reference genomes and determine which contig corresponds to which segment in the viral genomes.

You can use these mock metagenomes to test the method of identifying the corresponding segments of viral genomes.

## Identifying the corresponding segments of viral genomes

Let's assume we have a cross assembly of multiple metagenomic samples. We will first run the contugs through the developed model to identify contigs that look like segmented viruses.

Segments belonging to the same viral genome should have the same coverage in each metagenomic sample. So we will use this idea to group together segments belonging to the same viral genome.

Shotgun sequencing has shown to follow the [Lander-Waterman model](https://doi.org/10.1016/0888-7543(88)90007-9) and the Poisson distribution has been used to obtain the sequencing coverage of nucleotides. We use this idea to estimate how similar $c$ and $c'$ are in terms of their coverage values in each sample $S_{cov}(c, c')$, as shown in the following equation.

$S_{cov}(c, c') =  \min \Bigg( \prod_{n=1}^{M} Poisson\big(cov_{n}(c) | cov_{n}(c')\big), \prod_{n=1}^{M} Poisson\big(cov_{n}(c') | cov_{n}(c)\big) \Bigg)$

Here $cov_{n}(c)$ and $cov_{n}(c')$ refer to the coverage values of the contigs $c$ and $c'$ respectively in the sample $n$ where $M$ is the total number of samples. $Poisson$ is the Poisson probability mass function.

We can create a graph using $S_{cov}(c, c')$ of pairs of contigs. We can select a threshold $t$ (say 0.999) and if $S_{cov}(c, c') >= t$, then we put an edge between $c$ and $c'$. Similarly, we do this for all pairs of segmented-virus-like-contigs. 

Then we can use [clique detection](https://networkx.org/documentation/stable/reference/algorithms/generated/networkx.algorithms.clique.find_cliques.html) on this graph to find which cliques represent segmented viruses.



### Some further reading on cliques in graphs

* [Clique (graph theory) - Wikipedia](https://en.wikipedia.org/wiki/Clique_(graph_theory))
* [What is a clique?](https://www.youtube.com/watch?v=nBrFC0STApo)