function [reduced_image] =  GrayLevel(img,a)
k = 8;
while (k > a)
 target_levels = 2^a;
 target_compr_factor = 256 / target_levels;
 reduced_image = uint8(floor(double(img)/256 * target_levels) * target_compr_factor);
 
 k = k - 1;
end


