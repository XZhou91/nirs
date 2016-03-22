classdef Resample < nirs.modules.AbstractModule
    %% RESAMPLE - Resamples time-series NIRS data.
    %
    % Options:
    %     Fs - new sampling frequency (Hz)
    
    
    properties
        Fs = 4; % new sampling frequency (Hz)
    end
    
    methods
        function obj = Resample( prevJob )
            obj.name = 'Resample';
            
            if nargin > 0
                obj.prevJob = prevJob;
            end
        end
        
        function data = runThis( obj, data )
            for i = 1:length(data)
                if obj.Fs < data(i).Fs
                    
                    % resample data
                    d = data(i).data;
                    t = data(i).time;
                    
                    
                    
                    
                    if(length(t)<10000)
                        N = floor(t(end) * obj.Fs);
                        new_t = t(1) + (0:N-1)' / obj.Fs;
                        
                        % anti-aliasing filter
                        ord = floor( length(t) / 10 );
                        Fc = obj.Fs/data(i).Fs;
                        
                        b = fir1(ord,Fc);
                        
                        % zero phase filtering
                        d = filtfilt(b,1,d);
                        
                        % interpolation
                        d = interp1(t,d,new_t,'linear');
                    else
                        % The data is too large, use the resample function
                        % instead
                        d=resample(d,obj.Fs,fix(data(i).Fs));
                        
                        N = size(d,1);
                        new_t = t(1) + (0:N-1)' / obj.Fs*data(i).Fs/fix(data(i).Fs);
                        
                    end
                    
                    
                    data(i).data = d;
                    data(i).time = new_t;
                end
            end
        end
        
    end
    
end

