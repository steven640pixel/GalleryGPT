# Gallery-GPT

This repository contains the code, data and model for the paper titled "GalleryGPT: Analyzing Paintings with Large Multimodal Models".

## Install Packages
```
cd Gallery-GPT
conda create -n gallery_gpt python=3.10 -y
conda activate gallery_gpt
pip install -e .
pip install protobuf
```
## Enable Deepspeed and Flash-attention
```
pip install -e ".[train]"
pip install flash-attn --no-build-isolation
```

## Data Preparation
Download [Painting-Form dataset](https://huggingface.co/datasets/steven16/Painting-Form/tree/main).
"train_samples_tuning.json" corresponds to the annotations of painting formal analysis for instruction finetuning. 

Place the data in the root or other directory.
Data structure:
```
├── art_images_data/
│   ├── images/0.png
│   ├── images/1.png
│   ├── ...
├── train_samples_tuning.json
```

## Checkpoints
```
--model-path ./checkpoints/llava-share4v-lora/checkpoint-2512   ##https://drive.google.com/drive/folders/1eIo9RqGcJl2jUG4V8OLdnGPDAZXbyujE?usp=sharing
--model-base ./checkpoints/share4v/llava-7b      ###From huggingface: https://huggingface.co/Lin-Chen/ShareGPT4V-7B
```
