function data = loadDirectory( rootFolder, folderHierarchy, loadFunc, fileExt )

if nargin < 4,
    fileExt  = {'.nirs','.oxy3','.wl1'};
end
if nargin < 3,
    loadFunc = {@nirs.io.loadDotNirs,@nirs.io.loadOxy3,@(file)nirs.io.loadNIRx(file,false)};
end

if(~iscell(fileExt)); fileExt={fileExt}; end;
if(~iscell(loadFunc)); loadFunct={loadFunc}; end;

% remove trailing file separator
if rootFolder(end) == filesep
    rootFolder = rootFolder(1:end-1);
end

% default folder structure
if nargin < 2
    folderHierarchy = {'group','subject'};
end

% all files in subdirectory with correct extension
data = nirs.core.Data.empty;
for i=1:length(fileExt)
    files = rdir([rootFolder filesep '**' filesep '*' fileExt{i}]);
    
    
    for iFile = 1:length( files )
        
        % load using load function
        tmp = loadFunc{i}( files(iFile).name );
        
        % NIRx data uses folders instead of files... back up one
        if(~isempty(strfind(fileExt{i},'.wl')))
            files(iFile).name=[fileparts(files(iFile).name) filesep];
        end
        if ~isempty(tmp)
             if(strcmp(func2str(loadFunc{i}),'@(file)nirs.io.loadNIRx(file,false)') & isempty(data))
                 disp('Loading NIRx file geometry from:')
                 disp(['     ' files(iFile).name]);
                 disp('      Note: This registration will be used for all subjects');
                 disp('      To load all use "loadDirectory(<>,<>,@(file)nirs.io.loadNIRx(file))"');
                 tmp = nirs.io.loadNIRx(files(iFile).name,true);
                 probe=tmp.probe;
             elseif(strcmp(func2str(loadFunc{i}),'@(file)nirs.io.loadNIRx(file,false)'))
                 tmp.probe=probe;
            end
            
            data(end+1) = tmp;
            
            
            % split filename on separators
            fsplit = strsplit( files(iFile).name, filesep );
            rsplit = strsplit( rootFolder, filesep );
            
            % put demographics variables based on folder names
            demo = fsplit(length(rsplit)+1:end-1);
            
            for iDemo = 1:min(length(folderHierarchy),length(demo))
                data(end).demographics(folderHierarchy{iDemo}) = demo{iDemo};
            end
        end
    end
   
    
end
data = data';
end

