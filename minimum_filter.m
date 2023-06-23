function output  = minimum_filter(img)
%min filter

%applying the filter  
frame=[] 
[a b]=size(img)  
%making a zero matrix for the filtered   image 
output = zeros(size(img)) ; 

for i = 2 : a-1  
     for j = 2 : b-1 
         frame=[img(i,j) ,img(i-1 , j-1 ) ,img(i-1 , j) , img(i-1 , j+1 ) , img(i , j+1) , img(i , j-1) , img(i+1 , j ) , img(i+1 , j+1) , img(i+1 , j-1) ]; 
         val = min(frame) ;
         output(i, j) = val ;
        
     end 
end  

