function res =first_derv_1mask(gray_image)

% gray_image=rgb2gray(image);

gray_image=double(gray_image);

[rows cols]= size (gray_image);
mask=[-1 -2 -1;0 0 0;1 2 1];

res=gray_image;
for i=2:rows-1
 for j=2:cols-1
     temp=mask.*gray_image(i-1:i+1,j-1:j+1);
     res(i,j)=sum(temp(:));
   
 end 
end 




end


