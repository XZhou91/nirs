function [data,truth] = simDataROI(region, probe,noise, stim, basis );


if(nargin<2)
    noise = nirs.testing.simARNoise;
    probe=noise.probe;  % Currently this is a regular Probe class
    
    Name{1}='FpZ';
    xyz(1,:)=[0 0 0];
    Type{1}='FID-anchor';  % This is an anchor point
    Units{1}='mm';
    
    %Now let's add a few more
    Name{2}='Cz';
    xyz(2,:)=[0 100 0];
    Type{2}='FID-attractor';  % This is an attractor
    Units{2}='mm';
    
    Name{3}='T7';
    xyz(3,:)=[-200 0 0];
    Type{3}='FID-attractor';  % This is an attractor
    Units{3}='mm';
    
    Name{4}='T8';
    xyz(4,:)=[200 0 0];
    Type{4}='FID-attractor';  % This is an attractor
    Units{4}='mm';
    
    fid=table(Name',xyz(:,1),xyz(:,2),xyz(:,3),Type',Units',...
        'VariableNames',{'Name','X','Y','Z','Type','Units'});
    % and concatinate it to the probe
    probe.optodes=[probe.optodes; fid];
    
    noise.probe=probe;
    
    headsize=Dictionary();
    headsize('circumference')=420+randn(1)*50;
    noise.demographics('headsize')=headsize;
    
    probe=nirs.util.registerprobe1020(probe,headsize);    
end



if(length(probe)>1)

    for i=1:length(probe)
        if(nargin<3); noise = nirs.testing.simARNoise(probe(1)); end
        if(nargin<4); stim = nirs.testing.randStimDesign(noise.time, 2, 7, 1); end
        if(nargin<5); basis = Dictionary({'default'}, {nirs.design.basis.Canonical()}); end;
        [data(i,1),truth]=nirs.testing.simDataROI(region, probe(i),noise, stim, basis );
    end
    return
end


if(nargin<3); noise = nirs.testing.simARNoise(probe(1)); end
if(nargin<4); stim = nirs.testing.randStimDesign(noise.time, 2, 7, 1); end
if(nargin<5); basis = Dictionary({'default'}, {nirs.design.basis.Canonical()}); end;


noise.probe=probe;

noise.demographics('headsize')=probe.get_headsize;

d=nirs.util.convertlabels2roi(noise.probe,region);

w=d.weight;
w=w/max(w);
b=[7*w -3*w]';

data = noise.sorted();
link = data.probe.link;
Y    = data.data;
truth = zeros(size(Y,2), 1);


m = mean(Y);
Y = bsxfun(@plus, -log(Y), log(m));

[~,ii]=sort(w);
tt(ii)=[zeros(length(w)/2,1); ones(length(w)/2,1)];

channels=[d.source d.detector];
for i = 1:size(channels, 1)
    lst = find(link.source == channels(i,1) ...
        & link.detector == channels(i,2));
    
    % extincion coefs
    lambda = link.type(lst);
    e = nirs.media.getspectra(lambda);
    e = e(:,1:2);
    
    
    % sd distance
    l = data.probe.distances(lst);
    
    % design mat
    Xhbo = nirs.design.createDesignMatrix( stim, data.time, basis, 'hbo' );
    Xhbr = nirs.design.createDesignMatrix( stim, data.time, basis, 'hbr' );
    
    % add to channels according to MBLL
    for j = 1:length(lst)
        Yact = [Xhbo*e(j,1)*l(j) Xhbr*e(j,2)*l(j)] * b(:,i) *5/50*1e-6;
        Y(:,lst(j)) = Y(:,lst(j)) + Yact;
    end
    
    truth(lst) = tt(i);
end

Y = exp( -bsxfun(@minus, Y, log(m)) );


data.data = Y;
data.stimulus = stim;
