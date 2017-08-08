function specs = fs1_whichspecs(h)
%WHICHSPECS Determine which specs are required for this class.

%   Author(s): R. Losada
%   Copyright 1988-2002 The MathWorks, Inc.

% Prop name, data type, default value, listener callback
specs = cell2struct({'Fstop','udouble',12000,[],'freqspec'},specfields(h),2);



