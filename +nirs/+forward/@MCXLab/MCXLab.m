classdef MCXForwardModel
    %MCXFWDMODEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties%( Constant )
        gpuId = 1;
    end
    
    properties
        image; 
        probe;
        prop;
        
        directory = [nirs.utilities.defaultTmp() filesep 'tmp'...
            filesep num2str(randi(2^32-1))];

        Fm = 100;
        
        nPhotons = 1e7;
        nTimeGates = 40;
        timeStep = 1/100e6/300;
        nRepetitions = 1;
    end
    
    properties(SetAccess = private)
        nLayers;
        cleanup = true;
    end
    
    methods
        %% Constructor
        function obj = MCXForwardModel( image, prop, probe, Fm )
            error('This class needs updated in this package.')
            if nargin > 0, obj.image = image; end
            if nargin > 1, obj.prop = prop; end
            if nargin > 2, obj.probe = probe; end
            if nargin > 3, obj.Fm = Fm; end
        end
        
        %% Set/Get
        function obj = set.image( obj, image )
            assert( isa( image.vol,'uint8' ) )
            obj.image = image;
            obj.nLayers = max( obj.image.vol(:) );
        end
        
        function obj = set.probe( obj, probe )
            assert( probe.makeUniqueProbe().isValid() )
            obj.probe = probe;
        end
        
        function obj = set.directory( obj, d )
            assert( ischar( d ) )
            obj.directory = d;
            obj.cleanup = false;
        end
        
        %% Methods
        saveFluence( obj );
        meas = measurement( obj );
        meas = timeResolvedMeas( obj );
        [J,meas] = jacobian( obj );
        cfg = getConfig( obj, idx, idxType );
        
    end
    

        
end

