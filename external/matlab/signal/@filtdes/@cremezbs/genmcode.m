function b = genmcode(h, d)
%GENMCODE Generate MATLAB code

%   Author(s): J. Schickler
%   Copyright 1988-2004 The MathWorks, Inc.

[params, values, descs, iargs] = cremez_genmcode(d);
[fs fsstr]                     = getfsstr(d);

b = sigcodegen.mcodebuffer;

b.addcr(b.formatparams({'N', 'Fpass1', 'Fstop1', 'Fstop2', 'Fpass2', 'Fpass3', 'Fstop3', ...
        'Fstop4', 'Fpass4', 'Wpass1', 'Wstop1', 'Wpass2', 'Wstop2', 'Wpass3', params{:}}, ...
    {getmcode(d, 'Order'), getmcode(d, 'Fpass1'), getmcode(d, 'Fstop1'), ...
        getmcode(d, 'Fstop2'), getmcode(d, 'Fpass2'), getmcode(d, 'Fpass3'), ...
        getmcode(d, 'Fstop3'), getmcode(d, 'Fstop4'), getmcode(d, 'Fpass4'), ...
        getmcode(d, 'Wpass1'), getmcode(d, 'Wstop1'), getmcode(d, 'Wpass2'), ...
        getmcode(d, 'Wstop2'), getmcode(d, 'Wpass3'), values{:}}, ...
    {'','','','','','','','','','','','','','',descs{:}}));
b.cr;
b.addcr(designdesc(d));
b.addcr('b  = cfirpm(N, %s, ''bandstop'', %s%s);', ...
    sprintf('[-%s Fpass1 Fstop1 Fstop2 Fpass2 Fpass3 Fstop3 Fstop4 Fpass4 %s]%s', fsstr, fsstr, fs), ...
    '[Wpass1 Wstop1 Wpass2 Wstop2 Wpass3]', iargs);
b.add('Hd = dfilt.dffir(b);');

% [EOF]
