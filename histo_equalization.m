function [histo_image ]= histo_equalization(gray_image)

[row col] = size(gray_image);
no_of_pixels = row*col;


histo_image = uint8(zeros(row,col));

count = zeros(256,1);
prob = zeros(256,1);
res = zeros(256,1);

for i=1:row
    for j=1:col
        value=gray_image(i,j);
        count(value+1)=count(value+1)+1;
    end
    
end
sum = 0 ;
bins = 255;
for i=1:size(count)
    sum=sum+count(i);
    prob(i)=sum/no_of_pixels;
    res(i)=round(prob(i)*bins);
end

for i=1:row
    for j=1:col
        histo_image(i,j)=res(gray_image(i,j)+1);
    end
end

end