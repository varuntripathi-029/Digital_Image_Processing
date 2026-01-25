%date - 25/01/2026 
%created by - Varun Tripathi
clc ;
clear all;
close all;
I=imread('cameraman.tif');
imshow(I);
title('Original Image');
[m,n]=size(I);
figure;
%bit plane slicing

%for 0th bit plane
for ii=1:m
    for jj=1:n
        Bitp0(ii,jj)=bitand(I(ii,jj),1);
    end
end

%for 1st bit plane
for ii=1:m
    for jj=1:n
        Bitp1(ii,jj)=bitand(I(ii,jj),2);
    end
end

%for 2nd bit plane
for ii=1:m
    for jj=1:n
        Bitp2(ii,jj)=bitand(I(ii,jj),4);
    end
end
%for 3rd bit plane
for ii=1:m
    for jj=1:n
        Bitp3(ii,jj)=bitand(I(ii,jj),8);
    end
end
%for 4th bit plane
for ii=1:m
    for jj=1:n
        Bitp4(ii,jj)=bitand(I(ii,jj),16);
    end
end
%for 5th bit plane
for ii=1:m
    for jj=1:n
        Bitp5(ii,jj)=bitand(I(ii,jj),32);
    end
end
%for 6th bit plane
for ii=1:m
    for jj=1:n
        Bitp6(ii,jj)=bitand(I(ii,jj),64);
    end
end
%for 7th bit plane
for ii=1:m
    for jj=1:n
        Bitp7(ii,jj)=bitand(I(ii,jj),128);
    end
end

imshow(Bitp0);title('0th bit plane Image');
figure;imshow(Bitp1);title('1st bit plane Image');
figure;imshow(Bitp2);title('2nd bit plane Image');
figure;imshow(Bitp3);title('3rd bit plane Image');
figure;imshow(Bitp4);title('4th bit plane Image');
figure;imshow(Bitp5);title('5th bit plane Image');
figure;imshow(Bitp6);title('6th bit plane Image');
figure;imshow(Bitp7);title('7th bit plane Image');



%bit plane removal
%removing the 0th, 5th and 7th bit plane in 2 copies of the original image
for ii=1:m
    for jj=1:n
        bitpr0(ii,jj)=bitand(I(ii,jj),(255-(2^(0))));
        bitpr5(ii,jj)=bitand(I(ii,jj),(255-(2^(5))));
        bitpr7(ii,jj)=bitand(I(ii,jj),(255-(2^(7))));
    end
end

figure;imshow(bitpr0);title('0th bit plane removed Image');
figure;imshow(bitpr5);title('5th bit plane removed Image');
figure;imshow(bitpr7);title('7th bit plane removed Image');