#!/bin/bash
echo "start......"
export PATH="$PATH:/mnt/data2/zhiqiang/wenhao/LLaVA-new" #llava train, steps, merge
deepspeed --master_port=25643 --include localhost:0 llava/train/train_mem.py \
    --lora_enable True --lora_r 128 --lora_alpha 256 --mm_projector_lr 2e-5 \
    --deepspeed ./scripts/zero3.json \
    --model_name_or_path /mnt/data2/zhiqiang/wenhao/share4v/llava-7b \
    --version v1 \
    --data_path /mnt/data2/zhiqiang/wenhao/ArtGallery/more_data/train_sample_llava_all_match_formal_data_5turn_combine_v2.json \
    --image_folder /home/zhiqiang/home/wenhao/ArtGallery/art_data_center \
    --vision_tower Lin-Chen/ShareGPT4V-7B_Pretrained_vit-large336-l12 \
    --mm_projector_type mlp2x_gelu \
    --mm_vision_select_layer -2 \
    --mm_use_im_start_end False \
    --mm_use_im_patch_token False \
    --image_aspect_ratio pad \
    --group_by_modality_length True \
    --bf16 True \
    --output_dir ./checkpoints/llava-share4v-lora-2epoch-turn-centerimage-v2 \
    --num_train_epochs 2 \
    --per_device_train_batch_size 16 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 1 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 2496 \
    --save_total_limit 20 \
    --learning_rate 2e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 1 \
    --tf32 True \
    --model_max_length 2048 \
    --gradient_checkpointing True \
    --dataloader_num_workers 4 \
    --lazy_preprocess True \
    --report_to wandb
#wait
#deepspeed --master_port=25643 --include localhost:0 llava/train/train_mem.py \
#    --lora_enable True --lora_r 128 --lora_alpha 256 --mm_projector_lr 2e-5 \
#    --deepspeed ./scripts/zero3.json \
#    --model_name_or_path /mnt/data2/zhiqiang/wenhao/share4v/llava-7b \
#    --lora_path /home/zhiqiang/home/wenhao/LLaVA-new/checkpoints/llava-share4v-lora-2epoch-turn-centerimage/checkpoint-11236 \
#    --version v1 \
#    --data_path /home/zhiqiang/home/wenhao/ArtGallery/first_data/train_sample_llava_all_match_formal_data_5turn_combine.json \
#    --image_folder /home/zhiqiang/home/wenhao/ArtGallery/art_data_center \
#    --vision_tower Lin-Chen/ShareGPT4V-7B_Pretrained_vit-large336-l12 \
#    --mm_projector_type mlp2x_gelu \
#    --mm_vision_select_layer -2 \
#    --mm_use_im_start_end False \
#    --mm_use_im_patch_token False \
#    --image_aspect_ratio pad \
#    --group_by_modality_length True \
#    --bf16 True \
#    --output_dir ./checkpoints/llava-share4v-lora-3epoch-turn-centerimage-secondstage-v2 \
#    --num_train_epochs 3 \
#    --per_device_train_batch_size 16 \
#    --per_device_eval_batch_size 4 \
#    --gradient_accumulation_steps 1 \
#    --evaluation_strategy "no" \
#    --save_strategy "steps" \
#    --save_steps 314 \
#    --save_total_limit 20 \
#    --learning_rate 2e-5 \
#    --weight_decay 0. \
#    --warmup_ratio 0.03 \
#    --lr_scheduler_type "cosine" \
#    --logging_steps 1 \
#    --tf32 True \
#    --model_max_length 2048 \
#    --gradient_checkpointing True \
#    --dataloader_num_workers 4 \
#    --lazy_preprocess True \
#    --report_to wandb
#wait
#deepspeed --master_port=25643 --include localhost:0 llava/train/train_mem.py \
#    --lora_enable True --lora_r 128 --lora_alpha 256 --mm_projector_lr 2e-5 \
#    --deepspeed ./scripts/zero3.json \
#    --model_name_or_path /home/zhiqiang/home/wenhao/LLaVA-new/checkpoints/llava-7b-most-merge-imagecenter \
#    --version v1 \
#    --data_path /home/zhiqiang/home/wenhao/ArtGallery/first_data/train_sample_llava_all_match_formal_data_5turn_combine.json \
#    --image_folder /home/zhiqiang/home/wenhao/ArtGallery/art_data_center \
#    --vision_tower Lin-Chen/ShareGPT4V-7B_Pretrained_vit-large336-l12 \
#    --mm_projector_type mlp2x_gelu \
#    --mm_vision_select_layer -2 \
#    --mm_use_im_start_end False \
#    --mm_use_im_patch_token False \
#    --image_aspect_ratio pad \
#    --group_by_modality_length True \
#    --bf16 True \
#    --output_dir ./checkpoints/llava-share4v-lora-3epoch-turn-centerimage-merge-sencondstage-v2 \
#    --num_train_epochs 3 \
#    --per_device_train_batch_size 16 \
#    --per_device_eval_batch_size 4 \
#    --gradient_accumulation_steps 1 \
#    --evaluation_strategy "no" \
#    --save_strategy "steps" \
#    --save_steps 314 \
#    --save_total_limit 20 \
#    --learning_rate 2e-5 \
#    --weight_decay 0. \
#    --warmup_ratio 0.03 \
#    --lr_scheduler_type "cosine" \
#    --logging_steps 1 \
#    --tf32 True \
#    --model_max_length 2048 \
#    --gradient_checkpointing True \
#    --dataloader_num_workers 4 \
#    --lazy_preprocess True \
#    --report_to wandb


