clc;
clear all;
close all;
%%%%%%%%%%%%%%%%%
% 1 CONCOLUTION %
%%%%%%%%%%%%%%%%%
% 1
%read  image
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

figure;
subplot(1,3,1)
imshow(im)
title('Original image')

subplot(1,3,2)
imshow(im_sharp7)
title('Sharpened image through fspecial kernel log')

subplot(1,3,3)
imshow(im_blur7)
title('Blurred image through fspecial kernel gaussian')


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
H = fspecial('sobel'); imsobel=imfilter(im,H); 
subplot(2,2,1)
imshow(imsobel);H = fspecial('sobel'); imsobel=imfilter(im,H'); 
subplot(2,2,2)
imshow(imsobel);


im2=imread('wagon.png');
H = fspecial('sobel'); imsobel2=imfilter(im2,H); 
subplot(2,2,3)
imshow(imsobel2);
im2=imread('wagon.png');
H = fspecial('sobel'); imsobel2=imfilter(im2,H'); 
subplot(2,2,4)
imshow(imsobel2);

%%%%%%%%%%%%%%%%%%%
% 3 MEDIAN FILTER % 
%%%%%%%%%%%%%%%%%%%
% 8 - custom implementation of median
im8 = double(imread('wagon.png'));

% image resolution
size = size(im8);
rowSize = size(1);
colSize = size(2);

% kernelsize
M = 3;
N = 3;
output = double(zeros(rowSize,colSize));
for f = 1:rowSize-(M-1)
    for g = 1:colSize-(N-1)
        median = 0; % initialize median variable as zero
        for i = 0:M-1
            for j = 0:N-1        
                if(median<im8(f+i,g+j))
                        median = im8(f+i,g+j);
                end
            end
        end
        output(f+i,g+j) = median;
    end
    
end
subplot(1,2,1)
imagesc(output)
subplot(1,2,2)
imagesc(im8)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4 FAST FOURIER TRANSFORM %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 10
figure
I2 = (imread('lines.png'));
IFFT=abs(log(fftshift(fft2(double(I2)))));
subplot(2,2,2)
imagesc(IFFT);
subplot(2,2,1);
imshow(I2);
I3 = (imread('cameraman.png'));
IFFT=abs(log(fftshift(fft2(double(I3)))));
subplot(2,2,4)
imagesc(IFFT);
subplot(2,2,3);
imshow(I3);


% 11
A = [2.02124045975907,0.990908996115015,1.12326498848361,0.990908996115015,2.02124045975907];
B = [3.16842960228666,1.08779181706739,2.84377389176107,0.980343224255311,2.84377389176107,1.08779181706739];
figure
I4=abs(log(fftshift(fft2(A))));
I5=abs(log(fftshift(fft2(B))));
subplot(2,2,1)
imagesc(I4)
subplot(2,2,2)
imagesc(I5)
subplot(2,2,3)
text(-0.0,1.0,num2str(I4),'FontSize',6); axis off
subplot(2,2,4)
text(-0.0,1.0,num2str(I5),'FontSize',6); axis off

% filter out certain freq by setting some elements in I4 and I5 to zero
% take into account the "characteristics" of the two vectors i.e. the
% symmetric behaviour of fft2
I4_filtered = I4;
I5_filtered = I5;
I4_filtered(1)=0;
I5_filtered(1)=0;
figure;
subplot(2,2,1)
plot(I4)
title('I4');
subplot(2,2,2)
plot(I5)
title('I5');
subplot(2,2,3)
plot(I4_filtered)
title('I4 filtered');
subplot(2,2,4)
plot(I5_filtered)
title('I5 filtered');

figure;
subplot(2,2,1)
plot(ifft2(I4))
title('I4');
subplot(2,2,2)
plot(ifft2(I5))
title('I5');
subplot(2,2,3)
plot(ifft2(I4_filtered))
title('I4 filtered');
subplot(2,2,4)
plot(ifft2(I5_filtered))
title('I5 filtered');
% 12
im12 = double(im);
size = length(im12); %length of image of cameraman
imFreq=fftshift(fft2(im12));% frequency amplitude of image

filter = zeros(size,size);
% include only the central DC, from row 115 to 143.
center_ind = (length(filter)+2)/2;
%filter rectangle width
width = 20;
boundl = center_ind-width;
boundh = center_ind+width;
filter(boundl:boundh, boundl:boundh) = 1;
% LP = low pass, FS = frequency spectrum
im12LPFS = filter.*imFreq;
im12LP = ifft2(im12LPFS);
imshow(uint8(im12LP))

% 13
I5=imread('freqdist.png');
imshow(I5);
histogram(I5);
