% thresholding
function [newimg] = thresholding(img,k)
 [rows cols noMatrex]= size (img);
 newimg=zeros (rows, cols);
 for metricesIndex=1:1:noMatrex
  for i=1:rows
     for j=1:cols
        
       if img(i,j)>k 
             newimg(i,j)=1;
         else 
             newimg(i,j)=0;
         end 
     end 
  end 
 end
   

