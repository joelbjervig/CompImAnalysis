clc;
clear all;
close all;
%%%%%%%%%%%%%%%%%
% 1 CONCOLUTION %
%%%%%%%%%%%%%%%%%
% 1
%read image
im = imread('cameraman.png');

%create kernels
%sharp
S3 = fspecial('log',3,0.5);
S7 = fspecial('log',7,0.5);
S31 = fspecial('log',31,0.5);
figure;
mesh(S31);
% blur
B3 = fspecial('gaussian',3,5);
B7 = fspecial('gaussian',7,5);
B31 = fspecial('gaussian',31,5);
figure;
mesh(B31);


% convolve image with kernels
% sharpen
im_sharp3 = imfilter(im,S3);
im_sharp7 = imfilter(im,S7);
im_sharp31 = imfilter(im,S31);
% blur
im_blur3 = imfilter(im,B3);
im_blur7 = imfilter(im,B7);
im_blur31 = imfilter(im,B31);

%show images
% sharp
figure;
imshow(im_sharp3);
figure;
imshow(im_sharp7);
figure;
imshow(im_sharp31);
% blur
figure;
imshow(im_blur3);
figure;
imshow(im_blur7);
figure;
imshow(im_blur31);

% 2
% 3



%%%%%%%%%%%%%%%%%%
% 2 SOBEL FILTER %
%%%%%%%%%%%%%%%%%%
% 4


%%%%%%%%%%%%%%%%%%%
% 3 MEDIAN FILTER %
%%%%%%%%%%%%%%%%%%%
% 5
% 6
% 7
% 8
% 9

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4 FAST FOURIER TRANSFORM %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 10
% 11
% 12
% 13

