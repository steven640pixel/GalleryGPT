# Gallery-GPT

This repository contains the code, data and model for the paper titled "GalleryGPT: Analyzing Paintings with Large Multimodal Models".

![ex1]()

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

## Run LoRA-finetuning
```
sh finetune_lora_task.sh
```

## Checkpoints
You can download [base model](https://huggingface.co/Lin-Chen/ShareGPT4V-7B) then replace config.json with ours in root directory, and [LoRA weights](https://drive.google.com/drive/folders/1qLbnxxBwZ15ejaHES_LRCi2Fahv3Od5G?usp=drive_link) 

## Inference
```
python 
```
## Acknowledgement
The project is built on top of the amazing [LLaVA](https://github.com/haotian-liu/LLaVA) repository and [ShareGPT4V](https://github.com/lupantech/MathVista) repository. Thanks for their contributions!


If you find our work helpful to your research, please consider citing us with this BibTeX:
```bibtex
@inproceedings{MM24GalleryGPT,
  author    = {Yi Bin and
               Wenhao Shi and
               Yujuan Ding and
               Zhiqiang Hu and
               Zheng Wang and
               Yang Yang and
               See-Kiong Ng and
               Heng Tao Shen}
  title     = {GalleryGPT: Analyzing Paintings with Large Multimodal Models},
  booktitle = {Proceedings of the 32th ACM International Conference on Multimedia (MM'24), 28 October – 1 November, 2024, Melbourne, Australia.},
  year      = {2024},
}
```
