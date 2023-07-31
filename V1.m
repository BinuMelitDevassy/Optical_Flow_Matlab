% clear all; close all;
% 
% %assuming
% u = 0; % and
% x = 94;
% 
% getting image list
imagefiles = dir('*.jpg');
nfiles = length(imagefiles);    % Number of files found
% 
% % reading image to get size for projection
% img = imread( imagefiles(1).name );
% img_out = zeros(5,size(img,2), 3, 'uint8');
% 
% for n = 1:5 % u = 0 v= 0:4
%     img = imread( imagefiles(n).name );
%     img_out( n,:,:) = img( x, :, :);
% end
% 
% imshow( img_out );

%%
% loading optical flow data
close all;
%load('myOFx000223+tables4+pack_ob5');

%finding optical flow
% central view
img_center = imread( imagefiles(13).name );
[rows, cols, channel] = size(img_center);
% OF = zeros( 25, rows, cols, 2, 'double' );
% for n = 1:nfiles
%     img = imread( imagefiles(n).name );
%     OF( n,:,:,:) = mex_LDOF( double(img_center), double(img ));
% end


for R  = rows
    for C = cols
        A = zeros( 24, 4);
        outindex = 1;
        for u = 1 : 5
            for v = 1:5
                index = (u-1) * 5 + v;
                if( index == 13 ) % cetral view
                    continue;
                end
                
                A( outindex, : ) = [ u,v, muOFx{index}( R, C )];
            end
        end
    end
end
