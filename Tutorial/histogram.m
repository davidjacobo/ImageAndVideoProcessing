% Load Lena
in = imread('lena512.bmp');

[row col] = size(in);
h = zeros(256,1);

for i=1:row
    for j=1:col
        h(in(i,j)) = int16(h(in(i,j))) + 1;
    end
end

x_axis = 1:1:256;
plot(x_axis, h);