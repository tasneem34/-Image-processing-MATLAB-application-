function [res] = gray_slicing2(gray_image,min,max)

[row col]=size(gray_image);
res = gray_image;
for i=1:row
    for j=1:col
        if gray_image(i,j)>=min&&gray_image(i,j)<=max
            res(i,j)=255; %or gray_image(i,g)
        else 
            res(i,j)=gray_image(i,j);  %or 255
        end
    end
end


end