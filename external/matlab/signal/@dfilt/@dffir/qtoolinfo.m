function info = qtoolinfo(this)
%QTOOLINFO   Returns information for the QTool.

%   Author(s): J. Schickler
%   Copyright 1988-2004 The MathWorks, Inc.

% The first coefficient is the Word Length string. The second is the
% fractional length string.
info.normalize = 'numerator';

info.coeff.setops  = {'Name', 'Numerator', 'FracLabels', {'Numerator'}};
info.coeff.syncops = {'Num'};

info.product.setops  = {'ModeAvailable', 'Off', 'FracLabels', {'Product'}};
info.product.syncops = {'Product'}; % Syncs the defaults.

info.accum.setops  = {'ModeAvailable', 'Off', 'FracLabels', {'Accum.'}};
info.accum.syncops = {'Accum'};

info.output.setops = {'AutoScaleAvailable', 'Off'};

info.filterinternals = true;

% There is no state, multiplicand, stage input, or stage output.

% [EOF]
