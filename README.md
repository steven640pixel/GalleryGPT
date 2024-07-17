# Gallery-GPT
## Install Packages
```
cd Gallery-GPT
conda create -n llava_share python=3.10 -y
conda activate llava_share

for test:
pip install -e .
pip install protobuf

#for train:
#pip install -e ".[train]"
#pip install flash-attn --no-build-isolation   ##flash-attn has requirements for cuda-nvcc version.
```
## Checkpoints
```
--model-path ./checkpoints/llava-share4v-lora/checkpoint-2512   ##https://drive.google.com/drive/folders/1eIo9RqGcJl2jUG4V8OLdnGPDAZXbyujE?usp=sharing
--model-base ./checkpoints/share4v/llava-7b      ###From huggingface: https://huggingface.co/Lin-Chen/ShareGPT4V-7B
```
