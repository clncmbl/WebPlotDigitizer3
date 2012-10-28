% Test findShapes function

clear all;

%img = imread('./testImages/particles2.jpg');
img = imread('./testImages/randomShapes.jpg');
% Convert to binary.
%bwimg = im2bw(255-img,0.7);
bwimg = im2bw(img);

figure(1)
imshow(bwimg);

% Find shapes (white shapes on black)
shape_data = findShapes(bwimg) % displays a list of (x,y,area) for each object.

figure(2)
imshow(img);
hold on
plot(shape_data(:,1), shape_data(:,2), 'rx');

for ii = 1:1:size(shape_data,1)
    if (shape_data(ii,5)-shape_data(ii,4) > 0) && (shape_data(ii,7)-shape_data(ii,6) > 0)
        rectangle('Position',[shape_data(ii,4) shape_data(ii,6) (shape_data(ii,5)-shape_data(ii,4)) (shape_data(ii,7)-shape_data(ii,6))],'EdgeColor','Red');
    end
end

hold off
