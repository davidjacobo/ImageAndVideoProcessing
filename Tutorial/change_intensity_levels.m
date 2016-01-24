in = imread('lena512.bmp');
max_intensity = max(in(:)) +1;
lev = 2;
quant = (max_intensity / lev);

[row col] = size(in);

for i=1:row
    for j=1:col
        in(i,j) = floor(in(i,j) / quant);
    end
end

imshow(in);