function out = average(gray_image,windowSize)

% [rows, columns, numberOfColorChannels] = size(gray_image);
% if numberOfColorChannels > 1
% % gray_image=rgb2gray(gray_image);
% end 
f=ones(windowSize,windowSize)/windowSize^2;
out=filter2(f,gray_image,"same");

% [rows,cols]=size(gray_image);
% out=gray_image;


% sum=0;
% for i=2:rows-1
%  for j=2:cols-1
%  sum = 0;
%             for k = i-1:i+1
%                 for l = j-1:j+1
%                     sum = sum+gray_image(k,l)/windowSize ^ 2;
%                   
%                 end
%             end  
%             out(i,j)=sum;
% 
%             
%   end 
%  end
      

end