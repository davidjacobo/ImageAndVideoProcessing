% Load an image
in = imread('lena512.bmp');
[row col] = size(in);
trans = zeros(row, col);
out = zeros(row, col);

% map the image using the DCT transform over 8x8 sub-squares
for i=1:8:row-8
    for j=1:8:col-8
        sub_square = double(in(i:i+8 ,j:j+8));
        dct_square = dct2(sub_square);
        trans(i:i+8, j:j+8) = dct_square;
    end
end

% after mapping, we can quantize in the transformation space
% will use a value 'q' to establish that
q = 32;
trans = floor(trans./q)*q;

% the inverse process involves:
% decoding the information using the Huffman encoding
% we generated on the forward step

% Reverse the transform, for either DCT or FFT the function is
% exactly the same
for i=1:8:row-8
    for j=1:8:col-8
        sub_square = trans(i:i+8 ,j:j+8);
        dct_square = idct2(sub_square);
        out(i:i+8, j:j+8) = dct_square;
    end
end

min_p = min(out(:));
max_p = max(out(:));

out = uint8(256*((out - min_p)./(max_p-min_p)));

clf
imshow(out);