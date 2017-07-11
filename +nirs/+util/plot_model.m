function plot_model( stats , source , detector , type )
% nirs.util.plot_model( mdl );
% nirs.util.plot_model( GroupStats , source , detector , type );

switch class(stats)
    
    case {'LinearModel'}
        
        beta = stats.Coefficients.Estimate;
        covb = stats.CoefficientCovariance;
        weights = stats.ObservationInfo.Weights;
        weights = weights .* (40/median(weights));
        [~,worder] = sort(weights,'descend');
        
        Coefs = stats.CoefficientNames;
        
        for i = 1:length(Coefs)
            clear cond xvar;
            predictors = strsplit(Coefs{i},':');
            for j = 1:length(predictors)
                if strfind(predictors{j},'cond_')==1
                    cond = predictors{j}(6:end);
                else
                    xvar = predictors{j};
                end
            end
            if ~exist('cond','var') || ~exist('xvar','var')
                continue;
            end
            
            inds = strcmp( stats.Variables.cond , cond );
            xdata = stats.Variables.(xvar)(inds);
            ydata = stats.Variables.beta(inds);
            
            xdist = max(xdata)-min(xdata);
            xlim = [min(xdata)-2*xdist max(xdata)+2*xdist];
            xpts = linspace(xlim(1),xlim(2),100)';
            X = ones(length(xpts),length(beta));
            X(:,i) = xpts;
            
            [ypred,ci] = nirs.math.predci( X , beta , covb , stats.MSE , stats.DFE , .05 , false , true , true );
            
            fig = figure('Renderer','painters');
            ax = axes(fig);
            hold(ax,'on');
            for z = 1:length(xdata)
                ind = worder(z);
                scatter( ax , xdata(ind) , ydata(ind) , weights(ind) , 'MarkerEdgeColor',[0 0 0],'MarkerFaceColor',[.75 .75 .75],'LineWidth',1,'MarkerFaceAlpha',.5);
            end
            figxlim = get( ax , 'xlim' );
            hold(ax,'on');
            plot( xpts , ypred , '-k' , 'LineWidth' , 1.5 );
            plot( xpts , ci , ':r' , 'LineWidth' , 1.5 );
            hold( ax , 'off' );
            set( ax , 'xlim' , figxlim );
            xlabel(ax,['\bf' strrep(xvar,'_',' ')]);
            ylabel(ax,'\bfActivation \rm(\beta)');
            title(ax,['\bfActivation x ' strrep(xvar,'_',' ') sprintf('\n') '\rm' cond]);
        end
        
        
    case {'nirs.core.ChannelStats'}
        
        if nargin<4
            error('Must specify: source, detector, and type.');
        end
        
        vars = stats.variables;
        if width(vars)<5
            error('Model column is missing! Re-run with include_diagnostics set to true.');
        end
        
        ind = find( vars.source==source & vars.detector==detector & strcmpi(vars.type,type) , 1 );
        
        if isempty(ind)
            error('Could not find channel: source=%i , detector=%i , type=%s',source,detector,type);
        end
        
        mdl = vars.model{ind};
    
        nirs.util.plot_model( mdl );
        disp(mdl.Coefficients);
end


end