in = imread('lena512.bmp');
max_intensity = max(in(:)) +1;
lev = 2;
quant = (max_intensity / lev);

% Vectorize baby!!
in = floor(in./quant)*quant;

imshow(in);