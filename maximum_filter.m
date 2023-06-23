function output  = maximum_filter(k)
  
%applying the filter  
frame=[] 
[a b]=size(k)  
%making a zero matrix for the filtered   image 
output = zeros(size(k)) ; 

for i = 2 : a-1  
     for j = 2 : b-1 
         frame=[k(i,j) ,k(i-1 , j-1 ) ,k(i-1 , j) , k(i-1 , j+1 ) , k(i , j+1) , k(i , j-1) , k(i+1 , j ) , k(i+1 , j+1) , k(i+1 , j-1) ]; 
         val = max(frame) ;
         output(i, j) = val ;
        
     end 
end  

