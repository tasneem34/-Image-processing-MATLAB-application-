function [resizedImage]=resamplingUp(img,samplingfactor)
[r c matrixno]=size(img);

for metricesIndex=1:1:matrixno
    resizedImage(:,:,metricesIndex) =ReSampling(img(:,:,metricesIndex),samplingfactor);
end


function [img2] = ReSampling(image, samplingfactor)
    
[r c] = size(image);
x2=1;
i2=1;
for i=1:r
    for l=1:samplingfactor
        for x=1:c
            for l2=1:samplingfactor
                img2(i2,x2)=image(i,x);
                x2=x2+1;
            end
        end
        i2=i2+1;
        x2=1;
    end
end
end 
end 



