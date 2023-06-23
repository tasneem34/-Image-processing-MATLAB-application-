% 
% img1 =  imread('Task3.1.PNG');
% img2 = imread('Task3.2.PNG');
% img1=imresize(img1,[144 190]);
% SubtractImage = img1 - img2;
[baseFileName, folder] = uigetfile({'*.*';'*.png';'*.jpg';'*.bmp'}); 
fullFileName = fullfile(folder, baseFileName);
img1=imread(fullFileName);
[baseFileName, folder] = uigetfile({'*.*';'*.png';'*.jpg';'*.bmp'}); 
fullFileName = fullfile(folder, baseFileName);
img2=imread(fullFileName);


SubtractImage = motion2Images(img1,img2);

imshow(SubtractImage);


