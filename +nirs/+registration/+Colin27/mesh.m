function m = mesh
% this is a simple utility to just jet the COlin27 mesh.  The BEM code is
% more generic and 
        
% If I already have this file, then just load it
a=which('nirs.registration.Colin27.BEM');
folder=fileparts(a);

load(fullfile(folder,'ColinBEM.mat'));
m=fwdBEM.mesh;
return
