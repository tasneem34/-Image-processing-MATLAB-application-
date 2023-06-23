% task two contrast stretching
function newimg  = contrastStretching(img,s_max,s_min)
[rows cols noMatrex]= size (img);
 newimg=zeros (rows, cols);
 r_max=max(img,[],'all');
 r_min=min(img,[],'all');
 eq= (s_max-s_min)./(r_max-r_min);
 newimg= eq.*(img-r_min)+s_min;
 

