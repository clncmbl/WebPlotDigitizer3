% Count objects, find areas and centroids in BW images.

clear all;

%img = imread('./testImages/randomShapes.jpg');
img = imread('./testImages/particles.jpg');

rows = size(img,1);
cols = size(img,2);

% Convert to binary.
bwimg = im2bw(img);

bwimg2 = zeros(rows+2,cols+2);
bwimg2(2:(rows+1),2:(cols+1)) = bwimg;


pointConsidered = zeros(rows,cols); % has the particular pixel been considered?

objectCount = 0;        % number of objects
objectArea = [];        % numbers of pixels in each obejct
objectCentroid = [];    % location of centroid of each object
objectPixels = [];     % list of pixels of each object


for ii = 1:1:rows
    for jj = 1:1:cols
        
        
        
        if ((bwimg(ii,jj) == 1) && (pointConsidered(ii,jj) == 0))
            
            pointConsidered(ii,jj) = 1;
            objectCount = objectCount + 1;
            objectArea(objectCount) = 1;
            objectPixels(objectCount,1,1) = ii;
            objectPixels(objectCount,1,2) = jj;
            
            objectCentroid(objectCount,1) = ii;
            objectCentroid(objectCount,2) = jj;
            pxi = 1;
            oi = 1;
            
            while (pxi <= oi)
                                
                ai = objectPixels(objectCount,pxi,1);
                bi = objectPixels(objectCount,pxi,2);
                
                for pp = -1:1
                    for qq = -1:1
                        if ((bwimg2(ai+pp+1,bi+qq+1) == 1) && (pointConsidered(ai+pp,bi+qq) == 0))
                            objectArea(objectCount) = objectArea(objectCount) + 1;
                            oi = objectArea(objectCount);
                            objectPixels(objectCount,oi,1) = ai+pp;
                            objectPixels(objectCount,oi,2) = bi+qq;
                            
                            objectCentroid(objectCount,1) = (objectCentroid(objectCount,1)*(oi-1) + (ai+pp))/oi;
                            objectCentroid(objectCount,2) = (objectCentroid(objectCount,2)*(oi-1) + (bi+qq))/oi;
                            
                            pointConsidered(ai+pp,bi+qq) = 1;
                        end
                    end
                end
                
                
                pxi = pxi + 1;
            end
        end
        
        pointConsidered(ii,jj) = 1;
    end
end

fprintf('Number of Objects: %d\n', objectCount);

imshow(img)
hold on
plot(objectCentroid(:,2), objectCentroid(:,1),'x');

fprintf('[S.No]\t Area\t Centroid\n');
for obji = 1:1:objectCount
    fprintf('[%d]\t %d\t (%d,%d)\n', obji, objectArea(obji), objectCentroid(obji,1), objectCentroid(obji,2));
end

