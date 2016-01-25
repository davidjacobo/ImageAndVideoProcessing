% Load image
in = imread('lena512.bmp');

% define n
n = 5;

% read dimensions and create out matrix
[row col] = size(in);
out = zeros(row,col);

for i=1:n:row
    for j=1:n:col
        i1 = i + n;
        j1 = j + n;
  
        % If the sub-square is within limits
        % just calculate the average of his values
        % and save it on the whole area
        if i1 <= row & j1 <= col
            sum = int32(0);
            
            for l=i:1:i1
                for m=j:1:j1
                    sum = sum + int32(in(l,m));
                end
            end
            
            sum = sum/(n*n);
            
            for l=i:1:i1
                for m=j:1:j1
                    out(l,m) = sum;
                end
            end
        end
    end
end
out = uint8(out);

imshow(out);