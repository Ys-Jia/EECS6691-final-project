#!/usr/bin/env bash
CUDA_VISIBLE_DEVICES=0 PYTORCH_JIT=0 NCCL_LL_THRESHOLD=0 python \
  -W ignore \
  -i \
  -m torch.distributed.launch \
  --master_port=9999 \
  --nproc_per_node=1 \
  main.py \
  --network_feature resnet18 \
  --dataset finegym \
  --batch_size 32 \
  --img_dim 128 \
  --epochs 100 \
  --hyperbolic \
  --hyperbolic_version 1 \
  --pred_step 0 \
  --seq_len 5 \
  --num_seq 6 \
  --distance 'squared' \
  --lr 1e-3 \
  --prefix test_future_subaction_linear_finegym_hyperbolic \
  --fp16 \
  --fp64_hyper \
  --pretrain checkpoint.pth.tar \
  --linear_input predictions_z_hat \
  --n_classes 307 \
  --hierarchical_labels \
  --use_labels \
  --num_workers 12 \
  --only_train_linear \
  --pred_future \
  --test \
  --num_workers 8 \
  --seed 0 \
  --path_dataset dataset_info/finegym \
  --path_data_info dataset_info
