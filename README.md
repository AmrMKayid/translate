# Multilingual Translation

## Setup

```shell
conda create -n translate python=3.8.10 -y
conda activate translate
pip install -r requirements.txt
```


## Inference Server

### Convert the models first

```shell
mkdir models
ct2-transformers-converter --model facebook/nllb-200-3.3B --output_dir models/nllb-200-3.3B-converted
```

### Run the server locally
```shell
uvicorn translate.server:app --host 0.0.0.0 --port 8000
```

### Using docker to run the server
```shell
# Build
docker build -t translate .

# Run
docker run -it --rm --gpus 1,2,3,4,5,6,7,8 -p 8000:8000 -v $(pwd):/translate translate
```

### Client Side

This script translate the samsum dataset using the inference server
```
python main.py
```

## Translate

```shell
python -m translate.translate \
          --text="Cohere For AI will make the best instruct multilingual model in the world" \
          --source_language="English" \
          --target_language="Egyptian Arabic"
```
