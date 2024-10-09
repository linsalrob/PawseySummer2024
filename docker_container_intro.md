# Making docker containers 

First make a dockerFile. Here is an example. My dependencies are click, python, loguru and esm 

```
FROM quay.io/pawsey/rocm-mpich-base:rocm6.1-mpich3.4.3-ubuntu22

#
# phytneny_esm_image  
#

RUN apt-get update && \
    apt-add-repository -y universe && \
    apt install apt-transport-https curl gnupg git doxygen clang cmake -y && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y && \
    apt-get clean
#
# ROCm environment
#
ENV ROCM_RELEASE=6.1.0
ENV ROCM_PATH=/opt/rocm-$ROCM_RELEASE
ENV PATH=$ROCM_PATH/bin:$ROCM_PATH/llvm/bin:$PATH
#ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROCM_PATH/lib


# pip install stuff 
RUN pip install click
RUN pip install biopython 
RUN pip install loguru 
RUN pip install fair-esm 

# install this last 
#RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm6.2  --no-cache-dir
RUN pip install pytorch-triton-rocm --no-cache-dir
```


Then to build container run: 
```docker build . -t <image_name>```

Add a tag 
```docker tag <image_name> quay.io/susiegriggo/<image_name>:<tag>```

Push to quay.io 
```docker push quay.io/susiegriggo/<image_name>:<tag>``` 

NOTES: 
```need to add --platform linux/amd64 with pawsey base rocm``` <br/>
Docker often leaves a elot of files hanging about. Clean these out with: 
```docker system prune -af``` 


To pull a docker image later onto pawsey 

```
module load pawseyenv/2023.08
module load singularity/3.11.4-slurm 
singularity pull --dir /scratch/pawsey1018/gbouras/jaeger_phold docker://quay.io/gbouras13/phold:0.2.1_rocm_dev
```
