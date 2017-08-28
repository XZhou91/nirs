function [nirsout,eegout]=multimodal_align(nirsin,eegin);
%This function aligns (with time-dillation) EEG and NIRS data based on
%common stimulus events

nirsout=nirsin;
eegout=eegin;

for idx=1:length(nirsin)
    
    stimEEG=nirs.getStimNames(eegin(idx));
    stimNIRS=nirs.getStimNames(nirsin(idx));
    
    stim=intersect(stimEEG,stimNIRS);
    onsetEEG=[]; onsetNIRS=[];
    for i=1:length(stim)
        s=eegin(idx).stimulus(stim{i});
        onsetEEG=[onsetEEG; s.onset(:)];
        s=nirsin(idx).stimulus(stim{i});
        onsetNIRS=[onsetNIRS; s.onset(:)];
    end
    [onsetEEG,orE]=sort(onsetEEG);
    [onsetNIRS, orN]=sort(onsetNIRS);
    
    ndiff=inf;
    while(1)
    %iter closet point
        [k,d]=dsearchn(onsetNIRS,onsetEEG);
        
        lst=find(~abs(d>median(d)+1.2*std(d)));
        
        
        if(norm(abs(d))<ndiff)
            ndiff=norm(abs(d));
        else
            break
        end
        Y=onsetEEG(lst);
        X=[];
        X(:,1)=onsetNIRS(k(lst));
        X(:,2)=1;
        b=inv(X'*X)*X'*Y;
        onsetEEG=(onsetEEG-b(2))/b(1);
     
    end
    onsetNIRS(orN)=onsetNIRS;
    onsetEEG(orE)=onsetEEG;
    cntN=0; cntE=0;
    for i=1:length(stim)
        s=eegin(idx).stimulus(stim{i});
        s.onset=onsetEEG(cntE+[1:length(s.onset)]);
        cntE=cntE+length(s.onset);
        eegout(idx).stimulus(stim{i})=s;
        
        s=nirsin(idx).stimulus(stim{i});
        s.onset=onsetNIRS(cntN+[1:length(s.onset)]);
        cntN=cntN+length(s.onset);
        nirsout(idx).stimulus(stim{i})=s;
        
    end
    
    
end
