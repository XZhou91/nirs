classdef Dictionary
    
    properties (SetAccess = private)
        keys    = {}
        values  = {}
    end
    
    properties( Dependent = true )
        count
    end
    
    properties ( Access = private )
        indices;
        TABLE_SIZE = uint64(1024);
    end
    
    methods
        
        % constructor
        function obj = Dictionary( keys, vals )
            % check java classpath
            dictLoc = fileparts(which('Dictionary'));
            clsPth  = javaclasspath('-dynamic');
            if ~any( strcmp(dictLoc, clsPth) )
                javaaddpath( dictLoc );
            end
            
            % if key/value pairs provide add to dict
            if nargin == 2
                assert( length(keys)==length(vals) ...
                    && iscell(vals) ...
                    && iscell(keys) ...
                    && Dictionary.areUniqueKeys(keys) )  

                obj.keys        = keys;
                obj.values      = vals;
            elseif nargin == 1
                error('Constructor takes zero or two arguments.')
            end
            
            obj = obj.rehash();
        end
        
        % number of items in dictionary
        function count = get.count( obj )
            count = length(obj.keys);
        end
        
        % remove items
        function obj = remove( obj, keys )
            if ischar(keys)
                keys = {keys};
            end
            
            for k = 1:length(keys)
               [i, keyexists] = obj.getindex(keys{k});
               if keyexists
                   idx = obj.indices(i);
                   
                   obj.keys(idx)    = [];
                   obj.values(idx)  = [];
                   obj.indices(i)   = 0;

                   lst = obj.indices > idx;
                   obj.indices(lst) = obj.indices(lst) - 1;
               end
            end
            
        end
        
        % put new items
        function obj = put( obj, newKeys, newVals )
            
            if ~iscell(newKeys)
                newKeys = {newKeys};
            end
            
            if ~iscell(newVals)
                newVals = {newVals};
            end
            
            for k = 1:length( newKeys )
                [i, keyexists] = obj.getindex( newKeys{k} );

                if keyexists % key already exists
                    idx = obj.indices(i);
                    obj.values{idx} = newVals{k};
                else
                    % resize table if necessary
                    if (obj.count + 1) > obj.TABLE_SIZE / uint64(2)
                       obj = obj.resize( 3 * obj.TABLE_SIZE ); 
                    end
                    
                    % add index
                    obj.indices(i) = obj.count + 1;

                    % append keys and values
                    obj.keys    {end+1} = newKeys{k};
                    obj.values  {end+1} = newVals{k};
                end
            end
            
        end
        
        % get items
        function out = get( obj, keys )
            if ~iscell(keys)
                keys = {keys};
            end
            
            for k = 1:length( keys )
                [i, keyexists] = obj.getindex(keys{k});

                if keyexists
                    idx = obj.indices(i);
                    out{k} = obj.values{idx};
                else
                    out{k} = [];
                end
            end
            
            n = length(out);
            if n == 1
                out = out{1};
            elseif n == 0
                out = [];
            end
        end
        
        % check if keys exists
        function out = iskey( obj, key )
            [~,keyexists] = obj.getindex(key);
            out = keyexists;
        end
        
        % check if empty
        function out = isempty( obj )
           out = obj.count == 0;
        end
        
        % assignment, i.e. dict('hello') = 1234
        function obj = subsasgn(obj,s,b)
            if strcmp(s.type,'()')
                % assert( ischar(s.subs{1}) )
                newKey      = s.subs{1};
                newValue    = b;

                obj = obj.put( newKey, newValue );
            else
               	obj = builtin('subsasgn',obj,s,b);
            end
        end
        
        % retrieval; i.e. dict('hello') returns 1234
        function out = subsref(obj,s)
            if length(s) == 1 && strcmp(s.type,'()')
                % assert( ischar(s.subs{1}) )
                key = s.subs{1};
                out = obj.get( key );
            else
                out = builtin('subsref',obj,s);
            end
        end
        
        function obj = resize( obj, N )
            assert( N < uint64(2^32) )
   
            % resize table
            obj.TABLE_SIZE   = N;
            
            % rehash indices
            obj = obj.rehash();
        end
    end
    
    methods ( Static )
        function [h, b] = hash( key )
            b = getByteStreamFromArray(key);
            h = uint64(typecast(int32(MyHashLib.jenkinsHash(b)),'uint32'));
            
            % this can be used instead, but it is slower
            % h = typecast(java.lang.String(b).hashCode(),'uint32');
            % h = uint64(h(2));
        end
        
        function out = areUniqueKeys( keys )
            b = {};
            for i = 1:length( keys )
               b{i} = cast(getByteStreamFromArray(keys{i}),'char');
            end
            out = (length(b) == length(unique(b)));
        end
    end
    
    methods ( Access = private )
        % find index
        function [i, keyexists] = getindex( obj, key )
            b = getByteStreamFromArray(key);
            i = uint64(typecast(int32(MyHashLib.jenkinsHash(b)),'uint32'));
            
            i = mod(i, obj.TABLE_SIZE) + 1;
            
            % while full and keys don't match
            while obj.indices(i) && ~isequal(b, getByteStreamFromArray(obj.keys{obj.indices(i)}))
                    % increment index; 
                    % wrap to beginning if necessary
                    if i == obj.TABLE_SIZE
                        i = 1;
                    else
                        i = i + 1;
                    end
            end
            
             keyexists = logical( obj.indices(i) );
        end
        
        % rehash indices
        function obj = rehash( obj )
            obj.TABLE_SIZE  = max(1024, uint64(4 * length(obj.keys)));
            obj.indices = zeros(obj.TABLE_SIZE,1,'uint32');
            for k = 1:length(obj.keys)
                   i = obj.getindex(obj.keys{k});
                   obj.indices(i) = k;
            end
        end
    end
    
end

