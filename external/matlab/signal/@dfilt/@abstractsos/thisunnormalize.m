function thisunnormalize(Hd, g)
%THISUNNORMALIZE   

%   Author(s): V. Pellissier
%   Copyright 1988-2003 The MathWorks, Inc.

sosM = Hd.refsosMatrix;
for i=1:length(g),
  sosM(i,1:3) = sosM(i,1:3)*g(i);
end
Hd.refsosMatrix= sosM;


% [EOF]
