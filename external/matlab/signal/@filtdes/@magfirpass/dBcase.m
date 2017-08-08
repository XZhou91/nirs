function dBcase(h,d)
%DBCASE Handle the dB case.
%
% This should be a private method.

%   Author(s): R. Losada
%   Copyright 1988-2002 The MathWorks, Inc.

convertmag(h,d,...
    {'Dpass'},...
    {'Apass'},...
    {'pass'},...
    @todb);