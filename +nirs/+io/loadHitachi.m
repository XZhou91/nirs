function raw = loadHitachi(filen)

fileroot=strtok(filen,'.csv');
if(~isempty(strfind(filen,'_MES')))
    fileroot=fileroot(1:strfind(fileroot,'_MES')-1);
elseif(~isempty(strfind(filen,'_EXT')))
    fileroot=fileroot(1:strfind(fileroot,'_EXT')-1);
end

%Read Data
fileMES=dir([fileroot '_MES*.csv']);
for i=1:length(fileMES)
    [info{i},data{i}]=parsefile(fileMES(i).name);
end
%Read Aux 
fileEXT=dir([fileroot '_EXT*.csv']);
for i=1:length(fileEXT)
    [infoEXT{i},dataEXT{i}]=parsefile(fileEXT(i).name);
end

% Now put all the data together
raw=nirs.core.Data;
raw.demographics('Name')=info{1}.Name';
raw.demographics('Age')=str2num(info{1}.Age(1:end-1)');
raw.demographics('Gender')=info{1}.Sex';
raw.demographics('ID')=info{1}.ID';
raw.demographics('Comment')=info{1}.Comment';
raw.demographics('Patient Info')=info{1}.Patient_Information';

raw.description=fullfile(pwd,filen);

raw.time=[0:size(data{1},1)-1]*info{1}.Sampling_Periods;

for i=1:length(data)
    raw.data=horzcat(raw.data,data{i}(:,1+[1:length(info{i}.Wave_Length)]));
end


% Now deal with the probe
SrcPos=[]; DetPos=[]; link=table;
for i=1:length(info)
    probe=getprobefrominfo(info{i});
    l=probe.link;
    l.source=l.source+size(SrcPos,1);
    l.detector=l.detector+size(DetPos,1);
    SrcPos=[SrcPos; probe.srcPos];
    DetPos=[DetPos; probe.detPos];
    link=[link; l];
end
raw.probe=nirs.core.Probe(SrcPos,DetPos,link);




% Finally, see if we can deal with the stimulus marks
MarkChan=find(ismember(info{1}.Probe1,'Mark'));
marks=data{1}(:,1+MarkChan);

mUniq=unique(marks);
mUniq(1)=[];  %Remove zero

for i=1:length(mUniq)
    stim=nirs.design.StimulusEvents;
    stim.onset=raw.time(find(marks==mUniq(i)));
    stim.dur=ones(size(stim.onset));
    stim.amp=ones(size(stim.onset));
    raw.stimulus(['Mark_' num2str(mUniq(i))])=stim;
end


end



%% This function parses the data CSV files
function [info,data]=parsefile(filen)

% Load the data file
fid=fopen(filen,'r');
line=fgetl(fid);  % Figure out the number of columns based on the header
cnt=length(strfind(line,','))+1;
s=[];
for i=1:cnt
s=[s '%s '];
end
TData=textscan(fid,s,'delimiter',',');

%Start of data
dIdx=find(ismember(TData{1},'Data'))+1;

% Get the Data
data=zeros(length(TData{1})-dIdx,cnt-1);

f=[]; lstNum=[];
for i=1:length(TData)
    if(~isempty(str2num(TData{i}{dIdx+1})))
        f=[f '%f '];
        lstNum=[lstNum i];
    else
        f=[f '%s '];
    end
end

% This is faster then getting the data from the TData cell
frewind(fid);
for i=1:dIdx+1; fgetl(fid); end;
data=textscan(fid,f,'delimiter',',');

data=horzcat(data{lstNum});



%Parse the header
info = struct;
for i=1:dIdx;
    fld=TData{1}{i};
    if(~isempty(fld))
    fld(strfind(fld,' '))='_';
    fld(strfind(fld,'['))=[];
    fld(strfind(fld,']'))=[];
    
    val={};
    for j=2:length(TData)
        v=TData{j}{i};
        if(~isempty(v))
        if(~isempty(str2num(v))); v=str2num(v); end;
        val={val{:} v};
        end
    end
    try; val=vertcat(val{:}); end;
    info=setfield(info,fld,val');
    end
end

end


function probe=getprobefrominfo(info)

% figure out what probe this is
switch(info.Mode')
    case('3x5')
       m=3;
       n=5;
               
    otherwise
        % I don't want to just assume I can do this based on the mode
        error('This is a different probe design');
end

offset=15;

if(isfield(info,'Probe1'))
    [Y,X,Z]=meshgrid([0:-1:-m+1]*30,offset+[0:n-1]*30,0);
else % type II
    [Y,X,Z]=meshgrid([-m+1:1:0]*30,-offset+[0:-1:-n+1]*30,0);    
end

SrcPos=[X(1:2:end)' Y(1:2:end)' Z(1:2:end)'];
DetPos=[X(2:2:end)' Y(2:2:end)' Z(2:2:end)'];


[sI,dI]=meshgrid([1:size(SrcPos,1)],[1:size(DetPos,1)]);

WL=reshape(repmat(info.Wavenm,length(sI(:)),1),[],1);

link=table([sI(:); sI(:)],[dI(:); dI(:)],WL,'VariableNames',{'source','detector','type'});
link=sortrows(link,{'detector','source','type'});

probe=nirs.core.Probe(SrcPos,DetPos,link);
probe.link=probe.link(probe.distances==30,:);

end
