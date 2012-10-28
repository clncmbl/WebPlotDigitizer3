% This algorithm scans left to right and averages over blobs of pre-defined
% thickness (line thickness)

clear all;

%img = imread('TestImages/letterA.jpg');
img = imread('TestImages/TwoDottedLinesParallel.jpg');
%img = imread('TestImages/bwcomplex.png');


xmin = 1;
dx = 20;
xmax = size(img,2);

ymin = 1;
dy = 1;
ymax = size(img,1);

lineThickness = 20;

xData = [];
yData = [];

for xx = xmin:dx:xmax
    
    blobs = 0;
    prevbloby = -2*lineThickness;
    firstbloby = -2*lineThickness;
    bi = 1;
    
    for yy = ymin:dy:ymax
       
        if img(yy,xx) == 0
            
            if yy > firstbloby+lineThickness
                
                blobs = blobs + 1;
                bi = 1;
                blobData(blobs, bi) = yy;
                blobavg(blobs) = yy;
                firstbloby = yy;
                prevbloby = yy;
                
            else
                
                bi = bi + 1;
                blobData(blobs,bi) = yy;
                blobavg(blobs) = sum(blobData(blobs,1:bi))/bi;
                prevbloby = yy;
            end
            
        end
        
        % average blobs
        
        
    end
    
    if blobs > 0
        xData = [xx*ones(1,blobs), xData];
        yData = [blobavg(1:blobs), yData];
    end
    
end

imshow(img)
hold on
plot(xData,yData,'x');