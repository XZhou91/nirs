function specs = whichspecs(h)
%WHICHSPECS Determine which specs are required for this class.

%   Author(s): R. Losada
%   Copyright 1988-2002 The MathWorks, Inc.

% Prop name, data type, default value, listener callback
specs(1) = cell2struct({'GroupDelayVector','double_vector',...
        [2 3 1],[],'grpdelayspec'},specfields(h),2);

specs(2) = cell2struct({'WeightVector','double_vector',...
        [1 1 1],[],'magspec'},specfields(h),2);
