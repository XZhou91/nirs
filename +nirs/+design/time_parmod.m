function st=time_parmod(stim,center,reset)
% This function creates a time-paramtricaly modulated stimulus

if(nargin<2)
    center=true;
end
if(nargin<3)
    reset=false;
end

st=nirs.design.StimulusVector;
st.name=[stim.name '_pmod'];

dt=.5;
t=min(stim.onset)-10:dt:max(stim.onset+stim.dur+10);
s=zeros(size(t));

if(reset)
    for i=1:length(stim.onset)
        lst=find(t>=stim.onset(i) & t<=stim.onset(i)+stim.dur(i));
        if(center)
            cnt=lst-mean(lst);
        else
            cnt=lst-lst(1);
        end
        cnt=cnt/max(cnt);
        s(lst)=cnt;
    end
else
    lst=[];
    for i=1:length(stim.onset)
        lst=[lst find(t>=stim.onset(i) & t<=stim.onset(i)+stim.dur(i))];
    end
    if(center)
            cnt=lst-mean(lst);
        else
            cnt=lst-lst(1);
        end
        cnt=cnt/max(cnt);
        s(lst)=cnt;
end

st.time=t;
st.vector=s;