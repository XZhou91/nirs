classdef BandPassFilter < nirs.modules.AbstractModule
%% KurtoisFilter - Removes principal components reducing spatial covariance.
%
% Options:
%     ncomp - % number of components to remove
    properties
        lowpass;
        highpass;
        do_downsample;
    end

    methods

        function obj = BandPassFilter( prevJob )
           obj.name = 'Band Pass filter';
           obj.lowpass=[];
           obj.highpass=[];
           obj.do_downsample=true;
           if nargin > 0
               obj.prevJob = prevJob;
           end
        end
        
        function data = runThis( obj, data )
            for i = 1:length(data)
                
                if(isempty(obj.lowpass))
                    [fa,fb]=butter(4,[obj.highpass]*2/data(i).Fs,'high');
                elseif(isempty(obj.highpass))
                     [fa,fb]=butter(4,[obj.lowpass]*2/data(i).Fs,'low');
                else
                     [fa,fb]=butter(4,[obj.highpass obj.lowpass]*2/data(i).Fs);
                end
                
               
                % resample data
                d = data(i).data;
                d=filtfilt(fa,fb,d);
               
                
                if(~isempty(obj.lowpass) & obj.do_downsample & obj.lowpass*2<data(i).Fs)
                    t=data(i).time;
                    N = floor((t(end)-t(1)) * obj.lowpass*2);
                    new_t = t(1) + (0:N-1)' / (obj.lowpass*2);
                    d = interp1(t,d,new_t,'linear');
                    data(i).time=new_t;
                end
                
                % put back
                data(i).data = d; 
                
                               
            end
        end
    end
    
end

