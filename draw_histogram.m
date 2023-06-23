function count = draw_histogram(gray_image)

[row col] = size(gray_image);
count = zeros(1,256);
for i=1:row
    for j=1:col
        gray_level=gray_image(i,j);
        count(gray_level+1)=count(gray_level+1)+1;
    end
end
levels = 0:255;
bar(levels,count,'BarWidth',1,'FaceColor','b');

ax = gca;
ax.YColor = 'w';
ax.XColor = 'w';
grid on ;

 
end