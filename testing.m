
% [baseFileName, folder] = uigetfile({'*.jpg';'*.png';'*.bmp'}); 
% fullFileName = fullfile(folder, baseFileName);
% SmoothFiltered_Image=imread(fullFileName);
% SmoothFiltered_Image=rgb2gray(SmoothFiltered_Image);
% k=inputdlg('Enter The Value of  the Cut-off Frequency  : ',' Constant Value ',[1 50]); 
% k=str2double(k);
% SmoothFiltered_Image = GLPF(SmoothFiltered_Image,k);
% imshow(uint8(SmoothFiltered_Image));




fontSize = 16;
% Read in standard MATLAB gray scale demo image.
grayImage = imread('image_noisy.png');
grayImage=rgb2gray(grayImage);
subplot(2, 3, 1);
imshow(grayImage);
title('Original Grayscale Image', 'FontSize', fontSize);
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
message = sprintf('Left click and hold to begin drawing.\nSimply lift the mouse button to finish');
uiwait(msgbox(message));
hFH = imfreehand();
% Create a binary image ("mask") from the ROI object.
binaryImage = hFH.createMask();
binaryImage = im2uint8(binaryImage);
% binaryImage= negative(binaryImage);
% Display the freehand mask.
subplot(2, 3, 2);
imshow(binaryImage);
title('Binary mask of the region', 'FontSize', fontSize);

% Mask the image and display it.
% %Will keep only the part of the image that's inside the mask, zero outside mask.
blackMaskedImage = grayImage;
blackMaskedImage(~binaryImage) = 0;
subplot(2, 3, 3);
imshow(blackMaskedImage);
title('Masked Outside Region', 'FontSize', fontSize);
