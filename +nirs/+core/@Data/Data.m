classdef Data
    %% DATA - Holds NIRS data.
    % 
    % Properties: 
    %     description  - description of data (e.g. filename)
    %     data         - ntime x nchan array of NIRS data
    %     probe        - a Probe object containing measurement geometry
    %     time         - a vector containing the time
    %     Fm           - modulation frequency in MHz (0 for CW NIRS)
    %     Fs           - sampling frequency
    %     stimulus     - a Dictionary object containing stimulus info
    %                    (e.g. stimulus('tapping') returns a StimulusEvents Object)
    %     demographics - a Dictionary object containing demographics info
    %                    (e.g. demographics('age') returns 28)
    % 
    %     
    %  Methods:
    %     draw - displays the time series data and stimulus timings
    
    properties
        description
        data               % channel time series in columns
        probe;             % object describing geometry
        time               % vector of time points
        Fm = 0             % modulation frequency in MHz: 0 for CW; 110 for ISS
        auxillary = Dictionary();  % to hold generic time series information
        stimulus        = Dictionary();	% struct containing stim vectors (vectors, names, types)
        demographics    = Dictionary();	% table containing demographics (names, values)
    end
    
    properties( Dependent = true )
        Fs = 0;             % sampling frequency in Hz
    end

    methods
        function obj = Data( data, time, probe, Fm, stimulus, demographics, description )
            %% Data - Creates a Data object.
            % 
            % Args:
            %     data         - (optional) ntime x nchan array of NIRS data
            %     time         - (optional) a vector containing the time
            %     probe        - (optional) a Probe object containing measurement geometry
            %     Fm           - (optional) modulation frequency (0 for CW NIRS)
            %     stimulus     - (optional) a Dictionary object containing stimulus info
            %     demographics - (optional) a Dictionary object containing demographics info
            %     description  - (optional) description of data (e.g. filename)

            if nargin > 0, obj.data         = data;         end
            if nargin > 1, obj.time         = time;         end
            if nargin > 2, obj.probe        = probe;        end
            if nargin > 3, obj.Fm           = Fm;           end
            if nargin > 4, obj.stimulus     = stimulus;     end
            if nargin > 5, obj.demographics = demographics; end
            if nargin > 6, obj.description  = description;  end
        end
        
        function obj = set.stimulus( obj, stim )
           assert( isa(stim,'Dictionary') )
           obj.stimulus = stim;
        end
        
        function obj = set.demographics( obj, demo )
           assert( isa(demo,'Dictionary') )
           obj.demographics = demo;
        end
        
        function obj = set.auxillary( obj, auxillary )
            assert( isa(auxillary,'Dictionary') )
            obj.auxillary= auxillary;
        end
        
        
        function obj = set.time( obj, time )
           assert( isvector(time) )
           obj.time = time(:);
        end
        
        function out = get.Fs( obj )
            if length(obj.time) > 1
                out = 1 / mean(diff( obj.time ));
            else
                out = NaN;
            end
        end
        
        function [X,conds] = getStimMatrix( obj )
            %% returns a [time x condition] matrix of task timings and a cell array of condition names
            if numel(obj)>1
                X = cell(size(obj));
                conds = cell(size(obj));
                for i = 1:numel(obj)
                    [X{i},conds{i}] = obj(i).getStimMatrix;
                end
                return
            end
            t = obj.time;
            conds = obj.stimulus.keys;
            X = zeros(length(t),length(conds));
            for i = 1:length(conds)
                stim = obj.stimulus(conds{i});
                X(:,i) = stim.getStimVector(t);
            end
        end
        
        function out = sorted( obj, colsToSortBy )
            %% returns sorted channels of data by column in probe.link
            out = obj;
            if nargin < 2
                colsToSortBy = {'source', 'detector', 'type'};
            end
            if(length(obj)>1)
                for idx=1:length(obj)
                    out(idx)=sorted(obj(idx),colsToSortBy );
                end
                return
            end
            [out.probe.link, idx] = sortrows(out.probe.link, colsToSortBy);
            out.data = out.data(:,idx);
        end
        
        function varargout=draw( obj, lstChannels,adderr )
            %% draw - Plots the probe geometry.
            % 
            % Args:
            %     lstChannels - list of channels to show
            
            % get data
            if nargin == 1
                lstChannels = 1:size(obj(1).data,2);
                
            end
            if(nargin<3)
                adderr=false;
            end
            
            if(isempty(lstChannels))
                % draw a plot, but then turn it off to only show the stim
                % marks
                lstChannels=1;
                showplot=false;
            else
                showplot=true;
            end
            if(isempty(obj(1).data))
                lstChannels=[];
            end
            
            if(length(obj)>1)
                figure;
                a=round(sqrt(length(obj)));
                b=ceil(sqrt(length(obj)));
                for i=1:length(obj)
                    subplot(a,b,i);
                    obj(i).draw(lstChannels,adderr);
                    legend off;
                end
                return
            end
            
            t = obj.time;
            d = obj.data(:,lstChannels);
            
            % get stim vecs
            s = []; k = obj.stimulus.keys;
            for i = 1:length( obj.stimulus.keys )
                s = [s obj.stimulus.values{i}.getStimVector( t )];
            end
            

            % plots
            gca; hold on;
            
            % data min/max/size
            dmax = max( real(d(:)) );
            dmin = min( real(d(:)) );
            dsize = (dmax-dmin);
            
            % plot stim blocks if available
            if ~isempty(s) 
                s=s./(ones(size(s,1),1)*max(s(:)));
                % min/max of axes
                pmin = dmin - 0.3*dsize;
                pmax = dmax + 0.2*dsize;

                % adjust amplitude so stims are visible
                s = dsize*s + dmin - 0.25*dsize;
                
                % plot
                plot( t, s, 'LineWidth', 3 );
                
                % legend
                l = legend(k{:});
                set(l,'Interpreter', 'none');
                 dmax = max( dmax,max(s(:)));
                dmin = min( dmin,min(s(:)));
            dsize = (dmax-dmin);
                
                
            end
                % min/max of axes
               	pmin = dmin - 0.1*dsize;
                pmax = dmax + 0.1*dsize;
            
            
            % plot data
            if(~isreal(d) & adderr)
                h=errorbar( t, real(d),imag(d) );
            else
                h=plot( t, real(d) );
            end
            xlabel( 'seconds' );
            for i = 1:length(obj.stimulus.keys)
                legend(obj.stimulus.keys)
            end
            
            % axes limits
            xlim( [min(t) max(t)] );
            if pmin == pmax
                ylim(pmin + [-1 1]);
            else
                ylim( [pmin pmax] );
            end
            
            if(~showplot)
                set(h,'visible','off');
            end
            
            if(nargout>0)
                varargout{1}=h;
            end
            
        end
        
    end
end

