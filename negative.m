function [newImage] = negative(originalImage)
% levels of the 8-bit image
L = 2 ^ 8;    
  
% finding the negative                   
newImage = (L - 1) - originalImage;

end

