function tbl = roiAverage( data, R, names )
    if ischar( names )
        names = {names};
    end
    
    % sort probe
    link = data.probe.link;
    [link, ilink] = sortrows(link, {'source', 'detector', 'type'});
    
    % change ROIs to sorted indices
    for i = 1:length(R)
        R{i} = ilink(R{i});
    end
    
    % sort variables
    [vars, ivars] = sortrows(data.variables, {'cond', 'source', 'detector', 'type'});
    beta = data.beta(ivars);
    covb = data.covb(ivars, ivars);
    
    % unique conditions
    uconds = unique(vars.cond, 'stable');
    
    % loop over conditions
    varnames = {'ROI', 'Contrast', 'Beta', 'SE', 'DF', 'T', 'p'};
    tbl = table({},[],[],[],[],[],[], 'VariableNames', varnames);

    for i = 1:length(uconds)
        lst = strcmp(vars.cond, uconds{i});
        b = beta(lst);
        C = covb(lst,lst);
        
        for j = 1:length(R)
            % contrast vector
            c = zeros(size(b));
            c(R{j}) = 1/length(R{j});
            
            broi    = c'*b;
            se      = sqrt(c'*C*c);
            t       = broi / se;
            df      = data.dfe;
            p       = 2*tcdf(-abs(t),df);
            
            tmp = cell2table({names{j}, uconds{i}, broi, se, df, t, p});
            tmp.Properties.VariableNames = varnames;
            tbl = [tbl; tmp];
        end
    end
    
    q   = nirs.math.fdr( tbl.p );
    tbl = [tbl table(q)];
end