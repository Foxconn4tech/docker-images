FROM foxconn4tech/tensorflow

MAINTAINER martin.ludvik@foxconn4tech.com

#################################
# downloading pretrained models
#################################

RUN mkdir /models

WORKDIR /models

RUN mkdir object_detection \
    && mkdir deeplab

RUN mkdir object_detection/mask_rcnn_inception_resnet_v2_atrous_coco \
    && cd object_detection/mask_rcnn_inception_resnet_v2_atrous_coco  \
    && curl http://download.tensorflow.org/models/object_detection/mask_rcnn_inception_resnet_v2_atrous_coco_2018_01_28.tar.gz > out.tar.gz \
    && tar --strip-components=1 -zxf *.gz \
    && rm *.gz

RUN mkdir object_detection/faster_rcnn_inception_resnet_v2_atrous_coco \
    && cd object_detection/faster_rcnn_inception_resnet_v2_atrous_coco  \
    && curl http://download.tensorflow.org/models/object_detection/faster_rcnn_inception_resnet_v2_atrous_coco_2018_01_28.tar.gz > out.tar.gz \
    && tar --strip-components=1 -zxf *.gz \
    && rm *.gz

RUN mkdir deeplab/resnet_v1_50_beta_imagenet \
    && cd deeplab/resnet_v1_50_beta_imagenet \
    && curl http://download.tensorflow.org/models/resnet_v1_50_2018_05_04.tar.gz > out.tar.gz \
    && tar --strip-components=1 -zxf *.gz \
    && rm *.gz

RUN mkdir deeplab/xception_65_pascal \
    && cd deeplab/xception_65_pascal \
    && curl http://download.tensorflow.org/models/deeplabv3_pascal_train_aug_2018_01_04.tar.gz > out.tar.gz \
    && tar --strip-components=1 -zxf *.gz \
    && rm *.gz

RUN mkdir deeplab/mobilenetv2_pascal \
    && cd deeplab/mobilenetv2_pascal \
    && curl http://download.tensorflow.org/models/deeplabv3_mnv2_pascal_train_aug_2018_01_29.tar.gz > out.tar.gz \
    && tar --strip-components=1 -zxf *.gz \
    && rm *.gz \
    && mv model.ckpt-30000.data-00000-of-00001 model.ckpt.data-00000-of-00001 \
    && mv model.ckpt-30000.index model.ckpt.index