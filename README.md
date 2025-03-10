# PawseySummer2024
Code and ideas for the Pawsey summer internship 2024, designing CNNs for segmented viruses

# Poster

![alt text](https://github.com/linsalrob/PawseySummer2024/blob/main/poster/Sam_Klauer-Poster.png)
References for information and images at bottom

# Brief Summary of Processes

 - Use of refseq data for both segments and nonsegmented viruses to create a dataset
 - grid search using keras and tensorflow to determine greatest accuracy and minimal overfitting using a combination of different layers (number and type), number and size of filters, addition and values for regularizers and dropout, and final hyperparameter search of learning rate, batch size, and epochs
 - Production of a final trained keras model that has 84% accuracy in both the training set and test set
 - Extraction of a set of three segmented viruses and nonsegmented viruses that scores with high confidence in their respective categories
 - Creation of three coverage value sets to produce reads using InSilicoSeq
 - Combination of the reads in to a final full set of reads to then be assembled using metaSPAdes to obtain contigs
 - Use of coverm to map these contigs back to each of the three sets of reads making up the mock metagenome to determine the coverage values in each 
 - Taking the set of three coverage values for each contig and comparing all 12 to each other using a Poisson distribution
 - Extracting these values for comparison and setting a cutoff of similarity for clique detection
 - Production of a graph that shows correctly grouped segments and solo nonsegmented viruses


# The overview

Segmented viruses are a type of virus that contain multiple separate DNA pieces, or segments, rather than in a single continuous strand. Each segment typically encodes one or more proteins necessary for the virus's replication and infection processes. Influenza and rotavirus are well-known examples of segmented viruses. Understanding segmented viruses helps scientists develop better vaccines and treatments. For example, influenza vaccines are updated annually based on predictions about which viral strains are likely to circulate. Research on segmented viruses also aids in preparing for and mitigating the impacts of potential pandemics, as these viruses can rapidly evolve and spread.

Since segmented viruses contain multiple DNA sequences, it can be challenging to identify the constituent fragments from an environmental sample. This becomes more complicated when the segments have different lengths, high genetic variability, and little to no homology to the available reference genomes. This project aims to develop a deep learning tool to identify the components of eukaryotic segmented viruses from environmental sequencing data. 

First, a sequence database of available segmented viral genomes will be created to train the model. We propose to use Convolutional Neural Networks (CNNs), a deep learning technique that has proven effective in sequence classification. The CNN model will be trained on available segmented viral genomes using their sequence composition features. During the development, the students will get the opportunity to explore different encoding techniques to represent sequences and different model architectures. The model will be tested on various training and testing datasets created from known segmented viral genomes.

After processing the environmental sequencing data, sequences will be run through the developed deep learning model. As the segments of one genome should have a similar number of copies, the abundance information of the identified sequences will be compared to determine their corresponding segments. The identified segments will be modelled as a weighted graph based on a high abundance similarity threshold to determine corresponding segments by modelling as a clique problem (find subsets of vertices all adjacent to each other). 

This project will mainly make use of deep learning techniques and graph algorithms. Python and related packages (PyTorch, Biopython, igraph, scikit-learn, numpy, etc.) will be used for the implementation and our in-house SnakeMake pipeline template named Snaketool will be used to build a seamless executable pipeline.

# The milestones

_Milestone 1:_ Create a database of sequences from known segmented viral genomes for model training
_Milestone 2:_ Develop a deep-learning model that can identify segmented viral genomes from environmental sequencing data
_Milestone 3:_ Determine corresponding segments of viral genomes using their abundance and graph algorithms
_Milestone 4:_ Publish the developed bioinformatics tool as an end-to-end pipeline

# The Outcomes

The project outcomes include,
- A deep learning model that can identify segmented viral genomes from environmental sequencing data
- A bioinformatics tool which can be executed as an end-to-end pipeline to identify segmented viral genomes and their corresponding segments from environmental sequencing data

The student’s success will be determined by the following criteria.
- Assess the student's grasp of fundamental bioinformatics principles and techniques.
- Proficiency in programming languages commonly used in bioinformatics such as Python
- Competence in using available bioinformatics tools and software to pre-process data
- Ability to manage and analyse large datasets effectively
- Ability to troubleshoot and solve technical and analytical challenges
- Ability to work effectively in a team
- Periodic reviews and assessments to monitor progress and provide feedback

The project’s success will be determined by the following criteria.
- Meeting the predefined milestones of the project
- Thorough and accurate data analysis
- Comprehensive documentation of methods, processes, and results so that the project can be reproduced.
- Potential for the project to contribute to future research or practical applications


# The summary

- Limit to viral genomes <20 kb
- Download all viruses, segmented or not
- One-hot encode the sequences
- Build a CNN or a transformer model that can discriminate segmented/non-segmented viruses using PyTorch
- Train on segmented/not-segmented and which segments belong together
- Test on a portion of the data.

# Weekly student goals

[Weekly goals to work towards](student_goals.md)

# Poster References

# References:

Chatterjee P, Nair P, Chersich M, Terefe Y, Chauhan AS, Quesada F, Simpson G. One Health, "Disease X" & the challenge of "Unknown" Unknowns. Indian J Med Res. 2021 Mar;153(3):264-271. doi: 10.4103/ijmr.IJMR_601_21. PMID: 33906988; PMCID: PMC8204831.

McDonald SM, Nelson MI, Turner PE, Patton JT. Reassortment in segmented RNA viruses: mechanisms and outcomes. Nat Rev Microbiol. 2016 Jul;14(7):448-60. doi: 10.1038/nrmicro.2016.46. Epub 2016 May 23. PMID: 27211789; PMCID: PMC5119462.


# Images in Poster:

https://maelfabien.github.io/machinelearning/GridRand/#grid-search

da Cruz, M.H.P., Saito, P.T.M., Paschoal, A.R., Bugatti, P.H. (2019). Classification of Transposable Elements by Convolutional Neural Networks. In: Rutkowski, L., Scherer, R., Korytkowski, M., Pedrycz, W., Tadeusiewicz, R., Zurada, J. (eds) Artificial Intelligence and Soft Computing. ICAISC 2019. Lecture Notes in Computer Science(), vol 11509. Springer, Cham. https://doi.org/10.1007/978-3-030-20915-5_15
