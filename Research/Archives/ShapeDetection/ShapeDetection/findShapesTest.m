% Test findShapes function

clear all;

img = imread('./particlesColor.jpg');

% Convert to binary.
bwimg = im2bw(255-img,0.7);

figure(1)
imshow(bwimg);

% Find shapes (white shapes on black)
shape_data = findShapes(bwimg) % displays a list of (x,y,area) for each object.

figure(2)
imshow(img);
hold on
plot(shape_data(:,1), shape_data(:,2), 'x');
hold off
