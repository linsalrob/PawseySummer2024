
# Student Goals for Summer Student

_Week 1:_ Onboarding, Pawsey core training. 
Introduction to projects. The students will be provided with background reading material to familiarise with basic concepts in bioinformatics. The students will also be introduced to version-controlling platforms such as GitHub to manage the code produced in the project. 

_Week 2:_ Collect segmented viral genomes from GenBank. The students will be introduced to public genome databases, how to navigate through those databases and different tools used to download genomic data. The students will also learn about basic pre-processing steps when studying environmental sequencing data. 

Download segmented and non-segmented viruses. Stick with RefSeq. 

1. Check off every option within the "Segment" filter in [NCBI Virus](https://www.ncbi.nlm.nih.gov/labs/virus/vssi/#/virus?SeqType_s=Nucleotide). Depending on how thorough you want to be, you could first use the "GenBank/RefSeq" filter to limit the data to RefSeqs. It would dramatically decrease the number of check boxes in the "segment" filter but should maintain most of the diversity.
2. Download your results as a Results Table, but be sure to include the "Species" column. Genus might work too, since the majority of Genera are either wholly segmented or wholly monopartite. The exceptions I’m aware of are Begomovirus, Ipomovirus, and Macluravirus.
3. Parse out the species or genus from the table and deduplicate. Save the list in a plain text file, e.g. `virus_taxa_list.txt`
4. Use the deduplicated list of species or genus in Datasets to retrieve all of the sequence records. There is more info on the Datasets command-line tools here. You could use a command like:
5. `datasets download virus genome taxon --inputfile virus_taxa_list.txt --include genome`
  - My apologies – I had the wrong information about the Datasets tool. It can only retrieve data from one taxon at a time.
  - You could still use the datasets tool with a command like this: `datasets download virus genome taxon orbivirus --include genome`
  - However you would probably want to write it into a looping script to automatically add each taxon into the Datasets command and run it.
6. Please note that the "Segment" field is not yet included in the Datasets package. You can still get the sequences and most of the available metadata though.
7. Once you have the deduplicated list you could also retrieve the sequence records from NCBI Virus, however you would have to paste in each taxa one at a time.


_Week 3:_ Create a sequence database for model training/testing. The students will learn about different sequence sampling techniques to generate sub-sequences from genomes. 
 

> Create the size distribution of the segmented genomes and then pick the same number of closely related genomes from the non-segmented genomes. Check whether they are from the same species (e.g. all HIV) or diverse organisms. 
 

_Week 4:_ Develop and test the CNN model to identify segmented viral genomes from environmental sequencing data. The students will get the opportunity to explore different encoding techniques to represent sequence data. The students will also fine-tune the model by testing different parameter combinations and different model architectures. 


  - One hot encoding 
  - Chaos game representation encoding (ask Susie) 
  - Main question: can you learn segmented vs. Non segmented virus. Secondary question is can you learn which segments belong together (less likely)? 
  - Write a CNN or transformer using pytorch and load it into a [docker container](docker_container_intro.md) for running on the GPU cluster at Pawsey.

_Week 5:_ Develop and test the CNN model to identify segmented viral genomes from environmental sequencing data. The students will continue to fine-tune and test the model. 


_Week 6:_ End of year break - NO WORK 


_Week 7:_ End of year break - NO WORK 


_Week 8:_ Identify the corresponding segments of viral genomes. The students will learn about different graph algorithms and graph-related computational problems. The students will be exposed to various graph libraries and explore available implementations. 

For each contig that looks like a segmented virus we want to get a coverage graph based on the Poisson(cov1, cov2) [which should approach 1] .Use some random (~1) threshold to create a graph based on  [normalised] coverage counts, and use [clique detection](https://networkx.org/documentation/stable/reference/algorithms/generated/networkx.algorithms.clique.find_cliques.html) to find which cliques are from segmented viruses. 

_Week 9:_ Identify the corresponding segments of viral genomes. The students will fine-tune the developed methods and test them on different datasets. 

 
_Week 10:_ Publish the developed tool on public repositories. The students will be introduced to the process of publishing scientific software. The students will learn how to write test cases to test the accuracy of the code using testing frameworks, how to use code coverage tools, how to set up continuous integration and how to publish software to public repositories such as Bioconda and PyPI. 

 
_Week 11:_ Poster Draft 1 due. 


_Week 12:_ Poster due, poster judging. Pawsey Showcase & poster presentations. Program finishes. 
