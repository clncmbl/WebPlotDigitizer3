% Blob Code
% This is what is currently implemented.
clear all;

testImage = 'TestImages/FatCurvesIntersecting.jpg';

img = imread(testImage);

% plot bounds
xmin = 1;
ymin = 1;

xmax = 640;
ymax = 480;

fgColor = 0;
colorTolerance = 0.1;

% Averaging window size
lineThickness = 10;
dxav = lineThickness;
dyav = lineThickness;

% Step Size
dx = 20;
dy = 20;

stepMode = 'x';

figure(1);
subplot(2,2,1);
imshow(img);

bwimg = im2bw(img);
subplot(2,2,2);
imshow(bwimg);

if (stepMode == 'x') % step in x.
    
else % step in y.
    
end



