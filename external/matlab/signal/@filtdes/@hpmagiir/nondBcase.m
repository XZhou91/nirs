function nondBcase(h,d)
%NONDBCASE Handle the linear case.
%
% This should be a private method.

%   Author(s): R. Losada
%   Copyright 1988-2002 The MathWorks, Inc.

convertmag(h,d,...
    {'Astop','Apass'},...
    {'Estop','Epass'},...
    {'stop','pass'},...
    @tosquared);