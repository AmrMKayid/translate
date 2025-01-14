FROM nvidia/cuda:11.2.2-runtime-ubuntu20.04

RUN apt-get update && apt-get install -y python3-pip

WORKDIR /translate

COPY . /translate

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "translate.server:app", "--host", "0.0.0.0", "--port", "8000"]
