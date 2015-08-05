function data = loadDotNirs( filenames )

    % if a single filename, put it in a cell
    if ischar( filenames )
        filenames = {filenames};
    end
    
    data = nirs.core.Data.empty;
    
    % iterate through cell array
    for iFile = 1:length(filenames)
        try
            % load data as a struct
            d = load( filenames{iFile}, '-mat' );

            % put into data class
            thisFile = nirs.core.Data();
            thisFile.description = filenames{iFile};
                
            nTime = length(d.t);

            % data
            if size(d.d,1) == nTime
                thisFile.data = d.d;
            elseif size(d.d,2) == nTime
                thisFile.data = d.d.';
            else
                error('Data length and time vector don''t match in size.')
            end

            % time vector
            thisFile.time = d.t(:);

            % probe
            thisFile.probe = nirs.util.sd2probe( d.SD );
            [thisFile.probe.link, idx] = ...
                sortrows(thisFile.probe.link,{'source','detector','type'});

            thisFile.data = thisFile.data(:,idx);

            if isfield(d,'StimDesign')
                thisFile.stimulus = nirs.util.convertStimDesignStruct( d.StimDesign );
            end

            % demographics for group level
            if isfield(d,'Demographics')
                for i = 1:length(d.Demographics)
                    name    = d.Demographics(i).name;
                    value   = d.Demographics(i).value;
                    thisFile.demographics(name) = value;
                end
            end
            
        % append to list of data
        data(end+1) = thisFile;
            
        catch err
            warning(err.message)
        end
        
        
    end


end

