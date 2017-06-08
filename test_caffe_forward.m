function [scores, maxlabel] = test_caffe_forward(im, net)

% prepare oversampled input
% input_data is Height x Width x Channel x Num
% tic;
input_data = {prepare_image(im)};
% mean_data = caffe.io.read_mean( [model_dir 'train_mean-224.binaryproto']);
% scale=1;
% im=double(im);
% im=imresize(im,[224,224]);
% im=(im-mean_data)*scale;
% input_data = {im};
% toc;

% do forward pass to get scores
% scores are now Channels x Num, where Channels == 1000
% tic;
% The net forward function. It takes in a cell array of N-D arrays
% (where N == 4 here) containing data of input blob(s) and outputs a cell
% array containing data from output blob(s)
scores = net.forward(input_data);
% toc;

scores = scores{1};
scores = mean(scores, 2);  % take average scores over 10 crops

[~, maxlabel] = max(scores);


% ------------------------------------------------------------------------
function crops_data = prepare_image(im)
% ------------------------------------------------------------------------
% caffe/matlab/+caffe/imagenet/ilsvrc_2012_mean.mat contains mean_data that
% is already in W x H x C with BGR channels
% d = load('../+caffe/imagenet/ilsvrc_2012_mean.mat');
% mean_data = d.mean_data;

mean_data = caffe.io.read_mean('resnet50\train_mean-224.binaryproto');
IMAGE_DIM = 224;
CROPPED_DIM = 224;

% Convert an image returned by Matlab's imread to im_data in caffe's data
% format: W x H x C with BGR channels
im_data = im(:, :, [3, 2, 1]);  % permute channels from RGB to BGR
im_data = permute(im_data, [2, 1, 3]);  % flip width and height
im_data = single(im_data);  % convert from uint8 to single
im_data = imresize(im_data, [IMAGE_DIM IMAGE_DIM], 'bilinear');  % resize im_data
im_data = im_data - mean_data;  % subtract mean_data (already in W x H x C, BGR)

% oversample (4 corners, center, and their x-axis flips)
crops_data = zeros(CROPPED_DIM, CROPPED_DIM, 3, 10, 'single');
indices = [0 IMAGE_DIM-CROPPED_DIM] + 1;
n = 1;
for i = indices
  for j = indices
    crops_data(:, :, :, n) = im_data(i:i+CROPPED_DIM-1, j:j+CROPPED_DIM-1, :);
    crops_data(:, :, :, n+5) = crops_data(end:-1:1, :, :, n);
    n = n + 1;
  end
end
center = floor(indices(2) / 2) + 1;
crops_data(:,:,:,5) = ...
  im_data(center:center+CROPPED_DIM-1,center:center+CROPPED_DIM-1,:);
crops_data(:,:,:,10) = crops_data(end:-1:1, :, :, 5);
