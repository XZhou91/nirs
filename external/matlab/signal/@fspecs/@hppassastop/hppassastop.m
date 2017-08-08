function h = hppassastop(varargin)
%HPPASSASTOP   Construct a HPPASSASTOP object.
%   H = HPPASSASTOP(N,Fpass,Astop,Apass,Fs) constructs a highpass filter
%   specifications object with passband-edge specs.
%
%   N is the filter order and must be a positive integer.
%
%   Fpass is the passband-edge frequency and must be a positive scalar
%   between 0 and 1 if no sampling frequency is specified or between 0 and
%   Fs/2 if a sampling frequency Fs is specified.
%
%   Astop is the minimum stopband attenuation and it must be a positive
%   scalar.
%
%   Apass is the maximum passband deviation and it must be a positive
%   scalar.
%
%   Fs is the sampling frequency. If Fs is not specified, normalized
%   frequency is assumed. If Fs is specified, it must be a positive scalar.

%   Author(s): R. Losada
%   Copyright 1988-2003 The MathWorks, Inc.

h = fspecs.hppassastop;
respstr = 'Highpass with passband-edge specifications and stopband attenuation';
fstart = 2;
fstop = 2;
nargsnoFs = 4;
fsconstructor(h,respstr,fstart,fstop,nargsnoFs,varargin{:});




% [EOF]
