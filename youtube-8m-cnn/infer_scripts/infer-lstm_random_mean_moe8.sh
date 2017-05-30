MODEL=FrameRandomEvalModel
for part in ensemble_train ensemble_validate test; do
    CUDA_VISIBLE_DEVICES=1 python inference_with_rebuild.py \
              --output_dir="/Youtube-8M/model_predictions/${part}/lstm_random_mean_moe8" \
              --model_checkpoint_path="/home/zhangt/yt8m/frame_level_lstm_random_model/model.ckpt-145850" \
              --input_data_pattern="/Youtube-8M/data/frame/${part}/*.tfrecord" \
              --frame_features=True \
              --feature_names="rgb,audio" \
              --feature_sizes="1024,128" \
              --batch_size=32 \
              --file_size=4096 \
	      --model=$MODEL \
              --video_level_classifier_model=MoeModel \
              --moe_num_extend=16 \
              --moe_method=None \
              --lstm_cells=1024 \
              --class_size=100 \
              --encoder_size=100 \
              --moe_num_mixtures=8 \
              --moe_layers=3 \
              --run_once=True

done
