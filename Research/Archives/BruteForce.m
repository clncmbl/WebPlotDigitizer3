% Test 1: Brute Force

% This will scan vertically around the clicked point to find the plot line.

% testImage = 'TestImages/FatCurvesParallel.jpg';
 testImage = 'TestImages/FatCurvesIntersecting.jpg';
%testImage = 'TestImages/TwoDottedLinesParallel.jpg';

img = imread(testImage);

% Starting point
clickX = 119;
clickY = 395;

% plot bounds
xmin = 1;
ymin = 1;

xmax = 640;
ymax = 480;


% color of the plot in rgb?
plotColor = 0;

% tolerance
colorTol = 0.1;

% varation tolerance
% factor by which y can vary from prev point
varTol = 17;
minTol = 10;

% x-spacing (in pixels)
dx = 10;

% data collector
cDataX = [];
cDataY = [];
cp = 0;

figure(1);
subplot(2,2,1);
imshow(img);

bwimg = im2bw(img);
subplot(2,2,2);
imshow(bwimg);

yprev = clickX;

for xi = xmin:dx:xmax
    
    blobi = 0;    % Blob number
    blobSize = zeros(ymax-ymin+1); % Length of this blob
    blobContinuity = 0; % Are we continuing the last blob?
    
    ymean = (ymax+1)*ones(ymax-ymin+1);
    
    blobData = zeros(ymax-ymin+1, ymax-ymin+1); % raw blob data
    
    for yi = ymin:1:ymax
        
        if (bwimg(yi,xi) == plotColor)
            
            if blobContinuity == 0
                
                blobi = blobi + 1;
                blobSize(blobi) = blobSize(blobi) + 1;
                
                blobData(blobSize(blobi),blobi) = yi;
                
                blobContinuity = 1;
                
            else
                blobSize(blobi) = blobSize(blobi) + 1;
                blobData(blobSize(blobi),blobi) = yi;
            end
            
        else
            blobContinuity = 0;
        end
        
    end
    
    % scan blobs
    if blobi > 0
        
        ymi = 0;
        yselect = ymax + 1;
        
        for bi = 1:1:blobi
            ym_blob = mean(blobData(1:blobSize(blobi),blobi));
            if (cp > 2)
                typicalDisplacement = abs(cDataY(cp)-cDataY(cp-1));
                
                if typicalDisplacement < minTol
                    typicalDisplacement = minTol;
                end
                
                if abs(ym_blob-yprev) < varTol*typicalDisplacement
                    ymi = ymi + 1;
                    ymean(ymi) = ym_blob;
                end
            else
                ymi = ymi + 1;
                ymean(ymi) = ym_blob;
            end
        end
        
        if (ymi > 0)
            [mindiff, ym_index] = min(ymean(1:ymi) - yprev);

            yselect = ymean(ym_index);
        end

        if (blobi > 0) && (yselect ~= (ymax + 1))
            cp = cp + 1;
            cDataX(cp) = xi;        
            cDataY(cp) = yselect;
        end

        yprev = yselect;
    end
end

subplot(2,2,3);
imshow(bwimg);
hold on;
plot(cDataX,cDataY,'rx');

subplot(2,2,4);
plot(cDataX,ymax - cDataY);

figure(2);
imshow(bwimg);
hold on;
plot(cDataX,cDataY,'rx');

