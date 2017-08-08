function designobj = getdesignobj(this, str)
%GETDESIGNOBJ   Get the design object.

%   Author(s): J. Schickler
%   Copyright 2006 The MathWorks, Inc.

%#function fdfmethod.ellipparameq

designobj.ellip = 'fdfmethod.ellipparameq';

if nargin > 1
    designobj = designobj.(str);
end

% [EOF]
