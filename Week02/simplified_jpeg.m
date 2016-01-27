% Load an image
in = imread('lena512.bmp');
[row col] = size(in);
trans = zeros(row, col);
out = zeros(row, col);

% define the side of the sub-square nxn 
n = 8;

% map the image using the DCT transform over 8x8 sub-squares
 for i=1:n:row-n+1
    for j=1:n:col-n+1
         trans(i:i+n-1, j:j+n-1) = dct2(in(i:i+n-1, j:j+n-1));
    end
 end

% after mapping, we can quantize in the transformation space
% will use a value 'q' to establish that
q = 16;
trans = floor(trans./q)*q;

% the inverse process involves:
% decoding the information using the Huffman encoding
% we generated on the forward step

% Reverse the transform, for either DCT or FFT the function is
% exactly the same (I mean in terms of how long the script is)
for i=1:n:row-n+1
    for j=1:n:col-n+1
        out(i:i+n-1, j:j+n-1) = idct2(trans(i:i+n-1, j:j+n-1));
    end
end

clf
subplot(1,3,1); imshow(in);
subplot(1,3,2); imshow(trans);
subplot(1,3,3); imshow(out, [0 255]);
