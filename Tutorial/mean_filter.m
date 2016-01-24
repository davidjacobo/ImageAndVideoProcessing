%% Test script
I = imread('lena512.bmp');
imshow(I);

% Creating an average filter,
% it blurs the image and store it
% as O
filter = fspecial('average', [15,15]);
O  = imfilter(I, filter);
imshow(O);
imwrite(O, 'Lena_blur.bmp');