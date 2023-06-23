function res =first_derv(image)

image = double(image);
[r c]=size(image);
res =image;


maskX = [-1 -2 -1 ; 0 0 0 ;1 2 1];
maskY = [ -1 0 1 ; -2 0 2 ; -1 0 1] ;

for i=2:r-1
    for j=2:c-1
        
        Gx1 = maskX.* image(i-1:i+1,j-1:j+1);
        Gy1 = maskY.* image(i-1:i+1,j-1:j+1);
        Gx_val = sum(Gx1(:));
        Gy_val = sum(Gy1(:));
        res(i,j)=abs(Gx_val) + abs(Gy_val);  
    end
end
res = uint8(res);

end