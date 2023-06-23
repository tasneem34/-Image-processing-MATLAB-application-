% grayImage = imread('image_noisy.png');
% subplot(2, 3, 1);
% grayImage=rgb2gray(grayImage);
% imshow(grayImage);
% 
% message = sprintf('Left click and hold to begin drawing.\nSimply lift the mouse button to finish');
% uiwait(msgbox(message));
% hFH = imfreehand();
% % Create a binary image ("mask") from the ROI object.
% binaryImage = hFH.createMask();
% % Display the freehand mask.
% subplot(2, 3, 2);
% imshow(binaryImage);
% % grayImage = logical(grayImage);
% binaryImage = im2uint8(binaryImage);
% [rows cols]=size(grayImage);
% % % anding 
% output=grayImage;
% 
% for i=1:rows
%       for j=1:cols 
%           output(i,j)=binaryImage(i,j) * grayImage(i,j);
% 
%       end 
%       
% end
% 
% subplot(2, 3, 3); % Plot over original image.
% imshow(uint8(output));
% 
% % [y,x] = find(binaryImage==0) ; 
% % idx = imbinarize(I22) ;
% % for i = 1:3
% %     T = I1(:,:,1) ; 
% %     T(~idx) = 0 ;
% %     I1(:,:,i) = T ;
% % end



a=getappdata(0,'a');
fontSize = 10;
% Read in standard MATLAB gray scale demo image.
grayImage=a;
figure;
subplot(3,1 , 1);
imshow(grayImage);
title('Original Grayscale Image', 'FontSize', fontSize);
% message = sprintf('Left click and hold to begin drawing.\nSimply lift the mouse button to finish');
uiwait(msgbox('Left click and hold to begin drawing.\nSimply lift the mouse button to finish'));
hFH = imfreehand();
% Create a binary image ("mask") from the ROI object.
binaryImage = hFH.createMask();
% binaryImage = im2uint8(binaryImage);
% binaryImage= negative(binaryImage);
% Display the freehand mask.
subplot(3, 1, 2);
imshow(binaryImage);
title('Binary mask of the region', 'FontSize', fontSize);

% Mask the image and display it.
% %Will keep only the part of the image that's inside the mask, zero outside mask.
blackMaskedImage = grayImage;
blackMaskedImage(~binaryImage) = 0;
subplot(3, 1, 3);
imshow(blackMaskedImage);
title('Masked Outside Region', 'FontSize', fontSize);