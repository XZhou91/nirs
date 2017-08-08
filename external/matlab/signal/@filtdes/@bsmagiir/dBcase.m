function dBcase(h,d)
%DBCASE Handle the dB case.
%
% This should be a private method.

%   Author(s): R. Losada
%   Copyright 1988-2002 The MathWorks, Inc.

convertmag(h,d,...
    {'Epass1','Estop','Epass2'},...
    {'Apass1','Astop','Apass2'},...
    {'pass','stop','pass'},...
    'todb');