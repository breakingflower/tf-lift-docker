# tf-lift-docker

A docker build for [tf-lift](https://github.com/cvlab-epfl/tf-lift).
When running you need to use the runtime nvidia to pass the driver to the docker. The pretrained models are also included.

### Docker
When running the docker you will end up in the tf-lift folder. From here you can run the examples as in the original project. For example, saving the keypoints of someimage.jpg to someimage.txt using the pretrained kp network: 
```sh
docker pull fremmen/tf-lift 
docker run -it --rm --runtime=nvidia fremmen/tf-lift
$ ~/tf-lift: python main.py --task=test --subtask=kp --logdir=release-aug --test_img_file=someimage.jpg --test_out_file=someimage.txt --use_batch_norm=false --mean_std_type=hardcoded
```