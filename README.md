# PawseySummer2024
Code and ideas for the Pawsey summer internship 2024, designing CNNs for segmented viruses

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
