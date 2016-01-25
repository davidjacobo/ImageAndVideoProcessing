% Load the input
in = imread('lena512.bmp');

% Create a n x n filter of the type 'average'
filter = fspecial('average', [15,15]);

% Apply the filter
out  = imfilter(in, filter);

% Display the results, it should be a blury image
imshow(out);