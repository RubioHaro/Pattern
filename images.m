clc
clear all
warning off all

a = imread("peppers.png");
figure(1);

% subplot(1,1,1);
imshow(a);
% subplot(1,1,2);

figure(2)
impixel(a)

