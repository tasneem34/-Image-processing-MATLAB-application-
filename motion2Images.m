function SubtractImage = motion2Images(img1,img2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[M, N] = size(img1);
[M2, N2] = size(img2);

if  size(img2) ~=  size(img1)
  img2=imresize(img2,[M  N]);
end 
   
SubtractImage = img1 - img2;
end

