function [resizedImage] = SubSampling(originalImage,SamplingFactor)

[rows cols matricesNo] = size(originalImage);
for metricesIndex=1:1:matricesNo
    resizedImage(:,:,metricesIndex) = subSampling(originalImage(:,:,metricesIndex),SamplingFactor);
end

function [outImage] = subSampling(image, subSamplingFactor)
[rows cols] = size(image);
outImage = image(1:subSamplingFactor:rows,1:subSamplingFactor:cols);
end

end

