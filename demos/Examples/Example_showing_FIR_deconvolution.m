% Example of using an FIR (deconvolution) model in the GLM

% Generate some random event data for testing
raw(1)=nirs.testing.simData;	
raw(2)=nirs.testing.simData;
raw(3)=nirs.testing.simData;

job = nirs.modules.Resample;
job.Fs = 2; % resample to 2 Hz.  The GLM runs like O(N^2) so a high sample rate will slow things down

job = nirs.modules.OpticalDensity( job );
job = nirs.modules.BeerLambertLaw( job );

hb=job.run(raw);

% now, run the GLM model
job = nirs.modules.AR_IRLS( );

basis=nirs.design.basis.FIR;
basis.binwidth=1; % each bin is 1 sample wide
basis.nbins=24;  % 2hz x 12s = 60 bins
basis.isIRF=true;  % estimate impulse response (cf. full response) model

job .basis('default')=basis;
SubjStats = job .run( hb );  % run the analysis model


% This is a faster version of the group level model, but does not support
% random effects at the moment
job=nirs.modules.GroupAverage;
job.formula='beta ~ -1 + cond'
GroupStats = job.run(SubjStats);


% Now, estimate the HRF shape
dur=2;  % Since we estimated the impulse response, we need to convolve with the duration to get the full response

HRF = nirs.design.extractHRF(GroupStats,basis,dur,hb(1).Fs);

% HRF is a data class so you can draw it
HRF.draw;

ROI{1}=table([1 2 3 4]',[NaN NaN NaN NaN]','VariableNames',{'source','detector'});
ROI{2}=table([6 7 8 9]',[NaN NaN NaN NaN]','VariableNames',{'source','detector'});
HRFroi = nirs.util.roiAverage(HRF,ROI);

HRFroi.draw;  % The left panel is ROI1

% But we now have 24 betas to define the contrast, so we need to define the
% contrast over a time-window

contrastWinow=GroupStats.ttest('A[4:8]');  % This computes the contast from 2-4s (time point 4-8)

% Likewise, this is the test of points 4-8 vs points 1-2 
GroupStats.ttest('A[4:8]-A[1:2]').draw

nirs.util.roiAverage(contrastWinow,ROI);



