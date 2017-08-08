function nondBcase(h,d)
%nondBcase Handle the linear case.
%
% This should be a private method.

%   Author(s): R. Losada, J. Schickler
%   Copyright 1988-2003 The MathWorks, Inc.

convertmag(h,d,...
    {'Apass','Astop'},...
    {'Dpass','Dstop'},...
    {'pass','stop'},...
    @tolinear);

% [EOF]