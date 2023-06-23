% bit splicing


function [newImage]  = bitSplicing(gray_image)


[rows cols] = size (gray_image);
newImage = zeros(rows , cols , 8);

for k= 1:8 
   for row_index = 1:rows
      for col_index = 1:cols
          newImage(row_index,col_index ,k)= bitget(gray_image(row_index,col_index),k);     
      end

   end


end