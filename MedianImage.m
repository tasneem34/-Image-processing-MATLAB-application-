function out = MedianImage(gray_image,w)
% [rows,cols]=size(gray_image);
% out=gray_image;
% for i=2:rows-1
%  for j=2:cols-1
%      temp = [gray_image(i-1, j-1) gray_image(i-1, j) gray_image(i-1, j + 1) gray_image(i, j-1) gray_image(i, j) gray_image(i, j + 1) gray_image(i + 1, j-1) gray_image(i + 1, j) gray_image(i + 1, j + 1)];
%      temp = sort(temp);
%      out(i, j)= temp(5);
% end
% end
out= medfilt2(gray_image,[w w]);

end

