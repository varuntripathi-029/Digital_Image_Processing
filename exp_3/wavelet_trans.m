clc;
clear;
close all;

I = imread('cameraman.tif');
I = double(I);

imshow(uint8(I));
title('Original Image');
figure;

% Haar filters
h = [1 1]/sqrt(2);
g = [1 -1]/sqrt(2);

% Row filtering
L = conv2(I, h, 'same');
H = conv2(I, g, 'same');

% Downsample columns
L = L(:,1:2:end);
H = H(:,1:2:end);

% Column filtering
LL = conv2(L', h, 'same')';
LH = conv2(L', g, 'same')';
HL = conv2(H', h, 'same')';
HH = conv2(H', g, 'same')';

% Downsample rows
Ia = LL(1:2:end,:);
Iv = LH(1:2:end,:);
Ih = HL(1:2:end,:);
Id = HH(1:2:end,:);

imshow(uint8(Ia));
title('LL');
figure;
imshow(uint8(Iv));
title('LH');
figure;
imshow(uint8(Ih));
title('HL');
figure;
imshow(uint8(Id));
title('HH');
