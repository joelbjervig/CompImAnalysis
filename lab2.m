clc;
clear all;
close all;
%%%%%%%%%%%%%%%%%
% 1 CONCOLUTION %
%%%%%%%%%%%%%%%%%
% 1
%read  image
% im = imread('cameraman.png');

%create kernels
%sharp
% S3 = fspecial('log',3,0.5);
% S7 = fspecial('log',7,0.5);
% S31 = fspecial('log',31,0.5);
% figure;
% mesh(S31);
% % blur
% B3 = fspecial('gaussian',3,5);
% B7 = fspecial('gaussian',7,5);
% B31 = fspecial('gaussian',31,5);
% figure;
% mesh(B31);
% 
% 
% % convolve image with kernels
% % sharpen
% im_sharp3 = imfilter(im,S3);
% im_sharp7 = imfilter(im,S7);
% im_sharp31 = imfilter(im,S31);
% % blur
% im_blur3 = imfilter(im,B3);
% im_blur7 = imfilter(im,B7);
% im_blur31 = imfilter(im,B31);
% 
% figure;
% subplot(1,3,1)
% imshow(im)
% title('Original image')
% 
% subplot(1,3,2)
% imshow(im_sharp7)
% title('Sharpened image through fspecial kernel log')
% 
% subplot(1,3,3)
% imshow(im_blur7)
% title('Blurred image through fspecial kernel gaussian')


% %show images
% % sharp
% figure;
% imshow(im_sharp3);
% figure;
% imshow(im_sharp7);
% figure;
% imshow(im_sharp31);
% % blur
% figure;
% imshow(im_blur3);
% figure;
% imshow(im_blur7);
% figure;
% imshow(im_blur31);

% 2 - see overleaf
% 3



%%%%%%%%%%%%%%%%%%
% 2 SOBEL FILTER % AlEX HAR BÖRJAT 
%%%%%%%%%%%%%%%%%%
% H = fspecial('sobel'); imsobel=imfilter(im,H); 
% subplot(2,2,1)
% imshow(imsobel);H = fspecial('sobel'); imsobel=imfilter(im,H'); 
% subplot(2,2,2)
% imshow(imsobel);
% 
% 
% im2=imread('wagon.png');
% H = fspecial('sobel'); imsobel2=imfilter(im2,H); 
% subplot(2,2,3)
% imshow(imsobel2);
% im2=imread('wagon.png');
% H = fspecial('sobel'); imsobel2=imfilter(im2,H'); 
% subplot(2,2,4)
% imshow(imsobel2);

%%%%%%%%%%%%%%%%%%%
% 3 MEDIAN FILTER % JOEL HAR BÖRJAT
%%%%%%%%%%%%%%%%%%%
% 5
% im3 = imread('wagon_shot_noise.png');
% mean = fspecial('average',7);
% gauss = fspecial('gaussian',7,5);
% im3mea_7 = imfilter(im3,mean);
% im3med_7 = medfilt2(im3,[7 7]);
% im3gau_7 = imfilter(im3,gauss);
% 
% subplot(1,3,1)
% imshow(im3mea_7)
% title('mean')
% subplot(1,3,2)
% imshow(im3med_7)
% title('median')
% 
% subplot(1,3,3)
% imshow(im3gau_7)
% title('gaussian')

% 6
% 7
% 8 - custom implementation of median
% im8 = double(imread('wagon.png'));
% 
% % image resolution
% size = size(im8);
% rowSize = size(1);
% colSize = size(2);
% 
% % kernelsize
% M = 3;
% N = 3;
% output = double(zeros(rowSize-(M-1),colSize-(N-1)));
% for f = 1:rowSize-(M-1)
%     for g = 1:colSize-(N-1)
%         median = 0; % initialize median variable as zero
%         for i = 0:M-1
%             for j = 0:N-1        
%                 if(median<im8(f+i,g+j))
%                         median = im8(f+i,g+j);
%                 end
%             end
%         end
%         output(f+i,g+j) = median;
%     end
%     
% end
% subplot(1,2,1)
% imagesc(output)
% subplot(1,2,2)
% imagesc(im8)
% 9

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4 FAST FOURIER TRANSFORM %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 10
im4 = double(imread('napoleon.png'));
im4FFT = abs(fftshift(fft2(im4(24:77,176:271))));
figure;
imagesc(im4(24:77,176:271))
figure;
imagesc(im4FFT);
% 11
% 12
% 13

