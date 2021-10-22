### Update 21/10/11
Google drive links for datasets have been updated. \\ Please remember to download the new scores from the repo to replace the old scores in the dataset folder.
--------------------

### Update 18/12/5
New scores have been updated.
--------------------

# FIIQA
This is the website for our paper "Illumination Quality Assessment for Face Images: A Benchmark and A Convolutional Neural Networks Based Model", submitted to ICONIP

### Introduction
Kinds of adverse factors can decrease the performance of a face recognition system. Among them, the varying illumination condition is a common one. For some applications, a method that can automatically and objectively evaluate the illumination quality of a face image in a human-like manner is highly desired. However, few studies have been conducted in this area. To fill this research gap to some extent, we make two contributions. Firstly, in order to facilitate the study of illumination quality prediction for face images, a large-scale database, namely, Face Image Illumination Quality Database, is established. For each image in this database, there is an associated illumination quality score. Secondly, based on deep convolutional neural networks, a novel highly accurate model for predicting the illumination quality of face images is proposed. With this approach, given a test face image, the associated illumination quality score will be inferred. Its efficacy and efficiency have been corroborated on our database.

### Requirement
MATLAB with Caffe interface

### Face Image Illumination Quality Dataset 1.0
We have established a large-scale benchmark dataset, in which face images under various illumination patterns with associated illumination quality scores were constructed by making use of illumination transfer. Thus, we firstly collected an image set containing face images with various real-world illumination patterns, namely source illumination patterns set, and evaluated their illumination quality scores by subjective judgements. And after construction, this dataset is divided into three subsets for DCNN, the training set, the validation set and the testing set.

#### 1. Source illumination patterns set (https://drive.google.com/file/d/1cxfmDHjNK7EOs0KVHSj9JViFy6UOiob4/view?usp=sharing)
Unzip ZIP files, "illumination patterns.zip". In the "illumination patterns" folder, there are 200 images with various real-world illumination patterns, and for each image pattern, the associated illumination quality scores are given in the "patternsScores.mat", the sorted ranks, which are the class labels of those patterns, are given in the "patternsRank.mat".

#### 2. Training Set (https://drive.google.com/file/d/1VBmOeWtz5lsCzS-Ya72-m5mfHe-NVztp/view?usp=sharing)
Unzip 7Z files, "trainingset.7z". In "train-faces" folder, there are 159159 images with various illumination patterns, and for each image the rank label of the associated illumination quality are given in the "train_standard.txt".

#### 3. Validation Set (https://drive.google.com/file/d/1LvSLLgqQ1WlZRKXxKVjUa9SxX1fd6-Ln/view?usp=sharing)
Unzip ZIP files, "validationset.zip". In "val-faces" folder, there are 30930 images with various illumination patterns, and for each image the rank label of the associated illumination quality are given in the "val_standard.txt".

#### 4. Testing Set (https://drive.google.com/file/d/1Nv2HAzrwBobGNw4Zc86hU3pP-4W_ozXE/view?usp=sharing)
Unzip 7Z files, "testingset.7z". In "test-faces" folder, there are 34644 images with various illumination patterns, and for each image the rank label of the associated illumination quality are given in the "test_standard.txt".

### Face Illumination Quality Assessment Model: FIIQA<sub>DCNN</sub>
We have proposed a learning-based model, namely FIIQADCNN, for face illumination quality assessment. The matlab demo for our approach can be downloaded here. 
And the caffemodel we trained can be downloaded here: https://drive.google.com/file/d/1hjvai74Nc5fzo4iJ9-YVTMYM-FP8NADJ/view?usp=sharing, which should be put into the resnet50 folder.
