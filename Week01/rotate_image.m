% Load Lena :)
in = imread('lena512.bmp');

% rotate image, the rotation is specified in degrees
out = imrotate(in, 180.0);

% Display
imshow(out);