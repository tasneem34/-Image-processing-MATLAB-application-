function [newImage] = logarithmic (originalImage,c)
double_value = im2double(originalImage);
newImage= c*log(1+double_value);

end



