clear;
clc;
close all;

net = setup_caffe(0);

im = imread('real-test\1_extracted.jpg');
[~, maxlabel] = test_caffe_forward(im, net);%获取得分第二个参数0为CPU，1为GPU
score = pScores(maxlabel);

reset_caffe();
