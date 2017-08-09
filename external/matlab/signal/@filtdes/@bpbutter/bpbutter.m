function h = bpbutter
%BPBUTTER  Constructor for the bandpass butterworth filter type.
%
%   Outputs:
%       h - Handle to this object

%   Author(s): R. Losada
%   Copyright 1988-2002 The MathWorks, Inc.

h = filtdes.bpbutter;

% Call the super's constructor
filterType_construct(h);



