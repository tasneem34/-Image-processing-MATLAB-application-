function [newImage] = powerLaw (originalImage,c,g)
double_value = im2double(originalImage);
newImage= c*(double_value.^g); 

end

