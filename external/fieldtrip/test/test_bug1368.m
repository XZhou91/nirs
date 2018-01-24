function test_bug1368

% MEM 1500mb
% WALLTIME 00:20:00

% TEST ft_prepare_sourcemodel ft_headmodel_openmeeg headsurface

% use FieldTrip defaults instead of personal defaults
global ft_default;
ft_default = [];
ft_default.feedback = 'no';

pnt = [
  0         0    1.0000
  0.8944         0    0.4472
  0.2764    0.8507    0.4472
  -0.7236    0.5257    0.4472
  -0.7236   -0.5257    0.4472
  0.2764   -0.8507    0.4472
  0.7236   -0.5257   -0.4472
  0.7236    0.5257   -0.4472
  -0.2764    0.8507   -0.4472
  -0.8944    0.0000   -0.4472
  -0.2764   -0.8507   -0.4472
  0         0   -1.0000
  0.5257         0    0.8507
  0.6882    0.5000    0.5257
  0.1625    0.5000    0.8507
  -0.2629    0.8090    0.5257
  -0.4253    0.3090    0.8507
  -0.8507    0.0000    0.5257
  -0.4253   -0.3090    0.8507
  -0.2629   -0.8090    0.5257
  0.1625   -0.5000    0.8507
  0.6882   -0.5000    0.5257
  0.9511    0.3090         0
  0.5878    0.8090         0
  0.0000    1.0000         0
  -0.5878    0.8090         0
  -0.9511    0.3090         0
  -0.9511   -0.3090         0
  -0.5878   -0.8090         0
  -0.0000   -1.0000         0
  0.5878   -0.8090         0
  0.9511   -0.3090         0
  0.8507         0   -0.5257
  0.2629    0.8090   -0.5257
  -0.6882    0.5000   -0.5257
  -0.6882   -0.5000   -0.5257
  0.2629   -0.8090   -0.5257
  0.4253    0.3090   -0.8507
  0.4253   -0.3090   -0.8507
  -0.1625    0.5000   -0.8507
  -0.5257    0.0000   -0.8507
  -0.1625   -0.5000   -0.8507
  0.2511         0    0.9679
  0.3618    0.2629    0.8944
  0.0776    0.2389    0.9679
  0.8311    0.2389    0.5023
  0.6382    0.2629    0.7236
  0.7534         0    0.6575
  0.2328    0.7166    0.6575
  0.4472    0.5257    0.7236
  0.4840    0.7166    0.5023
  -0.1382    0.4253    0.8944
  -0.2032    0.1476    0.9679
  0.0296    0.8642    0.5023
  -0.0528    0.6882    0.7236
  -0.6095    0.4429    0.6575
  -0.3618    0.5878    0.7236
  -0.5319    0.6817    0.5023
  -0.4472    0.0000    0.8944
  -0.2032   -0.1476    0.9679
  -0.8127    0.2952    0.5023
  -0.6708    0.1625    0.7236
  -0.6095   -0.4429    0.6575
  -0.6708   -0.1625    0.7236
  -0.8127   -0.2952    0.5023
  -0.1382   -0.4253    0.8944
  0.0776   -0.2389    0.9679
  -0.5319   -0.6817    0.5023
  -0.3618   -0.5878    0.7236
  0.2328   -0.7166    0.6575
  -0.0528   -0.6882    0.7236
  0.0296   -0.8642    0.5023
  0.3618   -0.2629    0.8944
  0.4840   -0.7166    0.5023
  0.4472   -0.5257    0.7236
  0.6382   -0.2629    0.7236
  0.8311   -0.2389    0.5023
  0.9566    0.1476    0.2511
  0.8618    0.4253    0.2764
  0.6872    0.6817   -0.2511
  0.8090    0.5878         0
  0.8607    0.4429   -0.2511
  0.6708    0.6882    0.2764
  0.4360    0.8642    0.2511
  0.1552    0.9554    0.2511
  -0.1382    0.9511    0.2764
  -0.4360    0.8642   -0.2511
  -0.3090    0.9511         0
  -0.1552    0.9554   -0.2511
  -0.4472    0.8507    0.2764
  -0.6872    0.6817    0.2511
  -0.8607    0.4429    0.2511
  -0.9472    0.1625    0.2764
  -0.9566   -0.1476   -0.2511
  -1.0000    0.0000         0
  -0.9566    0.1476   -0.2511
  -0.9472   -0.1625    0.2764
  -0.8607   -0.4429    0.2511
  -0.6872   -0.6817    0.2511
  -0.4472   -0.8507    0.2764
  -0.1552   -0.9554   -0.2511
  -0.3090   -0.9511         0
  -0.4360   -0.8642   -0.2511
  -0.1382   -0.9511    0.2764
  0.1552   -0.9554    0.2511
  0.4360   -0.8642    0.2511
  0.6708   -0.6882    0.2764
  0.8607   -0.4429   -0.2511
  0.8090   -0.5878         0
  0.6872   -0.6817   -0.2511
  0.8618   -0.4253    0.2764
  0.9566   -0.1476    0.2511
  0.8127   -0.2952   -0.5023
  0.9472   -0.1625   -0.2764
  0.9472    0.1625   -0.2764
  0.8127    0.2952   -0.5023
  1.0000         0         0
  0.5319    0.6817   -0.5023
  0.4472    0.8507   -0.2764
  0.1382    0.9511   -0.2764
  -0.0296    0.8642   -0.5023
  0.3090    0.9511         0
  -0.4840    0.7166   -0.5023
  -0.6708    0.6882   -0.2764
  -0.8618    0.4253   -0.2764
  -0.8311    0.2389   -0.5023
  -0.8090    0.5878         0
  -0.8311   -0.2389   -0.5023
  -0.8618   -0.4253   -0.2764
  -0.6708   -0.6882   -0.2764
  -0.4840   -0.7166   -0.5023
  -0.8090   -0.5878         0
  -0.0296   -0.8642   -0.5023
  0.1382   -0.9511   -0.2764
  0.4472   -0.8507   -0.2764
  0.5319   -0.6817   -0.5023
  0.3090   -0.9511         0
  0.2032    0.1476   -0.9679
  0.4472         0   -0.8944
  0.2032   -0.1476   -0.9679
  0.6708    0.1625   -0.7236
  0.6095    0.4429   -0.6575
  0.6095   -0.4429   -0.6575
  0.6708   -0.1625   -0.7236
  -0.0776    0.2389   -0.9679
  0.1382    0.4253   -0.8944
  0.0528    0.6882   -0.7236
  -0.2328    0.7166   -0.6575
  0.3618    0.5878   -0.7236
  -0.2511    0.0000   -0.9679
  -0.3618    0.2629   -0.8944
  -0.6382    0.2629   -0.7236
  -0.7534    0.0000   -0.6575
  -0.4472    0.5257   -0.7236
  -0.0776   -0.2389   -0.9679
  -0.3618   -0.2629   -0.8944
  -0.4472   -0.5257   -0.7236
  -0.2328   -0.7166   -0.6575
  -0.6382   -0.2629   -0.7236
  0.1382   -0.4253   -0.8944
  0.3618   -0.5878   -0.7236
  0.0528   -0.6882   -0.7236
  ];

tri = [
  1    43    45
  13    44    43
  15    45    44
  43    44    45
  2    46    48
  14    47    46
  13    48    47
  46    47    48
  3    49    51
  15    50    49
  14    51    50
  49    50    51
  13    47    44
  14    50    47
  15    44    50
  47    50    44
  1    45    53
  15    52    45
  17    53    52
  45    52    53
  3    54    49
  16    55    54
  15    49    55
  54    55    49
  4    56    58
  17    57    56
  16    58    57
  56    57    58
  15    55    52
  16    57    55
  17    52    57
  55    57    52
  1    53    60
  17    59    53
  19    60    59
  53    59    60
  4    61    56
  18    62    61
  17    56    62
  61    62    56
  5    63    65
  19    64    63
  18    65    64
  63    64    65
  17    62    59
  18    64    62
  19    59    64
  62    64    59
  1    60    67
  19    66    60
  21    67    66
  60    66    67
  5    68    63
  20    69    68
  19    63    69
  68    69    63
  6    70    72
  21    71    70
  20    72    71
  70    71    72
  19    69    66
  20    71    69
  21    66    71
  69    71    66
  1    67    43
  21    73    67
  13    43    73
  67    73    43
  6    74    70
  22    75    74
  21    70    75
  74    75    70
  2    48    77
  13    76    48
  22    77    76
  48    76    77
  21    75    73
  22    76    75
  13    73    76
  75    76    73
  2    78    46
  23    79    78
  14    46    79
  78    79    46
  8    80    82
  24    81    80
  23    82    81
  80    81    82
  3    51    84
  14    83    51
  24    84    83
  51    83    84
  23    81    79
  24    83    81
  14    79    83
  81    83    79
  3    85    54
  25    86    85
  16    54    86
  85    86    54
  9    87    89
  26    88    87
  25    89    88
  87    88    89
  4    58    91
  16    90    58
  26    91    90
  58    90    91
  25    88    86
  26    90    88
  16    86    90
  88    90    86
  4    92    61
  27    93    92
  18    61    93
  92    93    61
  10    94    96
  28    95    94
  27    96    95
  94    95    96
  5    65    98
  18    97    65
  28    98    97
  65    97    98
  27    95    93
  28    97    95
  18    93    97
  95    97    93
  5    99    68
  29   100    99
  20    68   100
  99   100    68
  11   101   103
  30   102   101
  29   103   102
  101   102   103
  6    72   105
  20   104    72
  30   105   104
  72   104   105
  29   102   100
  30   104   102
  20   100   104
  102   104   100
  6   106    74
  31   107   106
  22    74   107
  106   107    74
  7   108   110
  32   109   108
  31   110   109
  108   109   110
  2    77   112
  22   111    77
  32   112   111
  77   111   112
  31   109   107
  32   111   109
  22   107   111
  109   111   107
  7   113   108
  33   114   113
  32   108   114
  113   114   108
  8    82   116
  23   115    82
  33   116   115
  82   115   116
  2   112    78
  32   117   112
  23    78   117
  112   117    78
  33   115   114
  23   117   115
  32   114   117
  115   117   114
  8   118    80
  34   119   118
  24    80   119
  118   119    80
  9    89   121
  25   120    89
  34   121   120
  89   120   121
  3    84    85
  24   122    84
  25    85   122
  84   122    85
  34   120   119
  25   122   120
  24   119   122
  120   122   119
  9   123    87
  35   124   123
  26    87   124
  123   124    87
  10    96   126
  27   125    96
  35   126   125
  96   125   126
  4    91    92
  26   127    91
  27    92   127
  91   127    92
  35   125   124
  27   127   125
  26   124   127
  125   127   124
  10   128    94
  36   129   128
  28    94   129
  128   129    94
  11   103   131
  29   130   103
  36   131   130
  103   130   131
  5    98    99
  28   132    98
  29    99   132
  98   132    99
  36   130   129
  29   132   130
  28   129   132
  130   132   129
  11   133   101
  37   134   133
  30   101   134
  133   134   101
  7   110   136
  31   135   110
  37   136   135
  110   135   136
  6   105   106
  30   137   105
  31   106   137
  105   137   106
  37   135   134
  31   137   135
  30   134   137
  135   137   134
  12   138   140
  38   139   138
  39   140   139
  138   139   140
  8   116   142
  33   141   116
  38   142   141
  116   141   142
  7   143   113
  39   144   143
  33   113   144
  143   144   113
  38   141   139
  33   144   141
  39   139   144
  141   144   139
  12   145   138
  40   146   145
  38   138   146
  145   146   138
  9   121   148
  34   147   121
  40   148   147
  121   147   148
  8   142   118
  38   149   142
  34   118   149
  142   149   118
  40   147   146
  34   149   147
  38   146   149
  147   149   146
  12   150   145
  41   151   150
  40   145   151
  150   151   145
  10   126   153
  35   152   126
  41   153   152
  126   152   153
  9   148   123
  40   154   148
  35   123   154
  148   154   123
  41   152   151
  35   154   152
  40   151   154
  152   154   151
  12   155   150
  42   156   155
  41   150   156
  155   156   150
  11   131   158
  36   157   131
  42   158   157
  131   157   158
  10   153   128
  41   159   153
  36   128   159
  153   159   128
  42   157   156
  36   159   157
  41   156   159
  157   159   156
  12   140   155
  39   160   140
  42   155   160
  140   160   155
  7   136   143
  37   161   136
  39   143   161
  136   161   143
  11   158   133
  42   162   158
  37   133   162
  158   162   133
  39   161   160
  37   162   161
  42   160   162
  161   162   160
  ];

pnt = pnt .* 10; % convert to cm
sel = find(pnt(:,3)>0);

elec.pnt = pnt(sel,:);
for i=1:length(sel)
  elec.label{i} = sprintf('electrode%d', i);
end
elec.unit = 'cm';

pos = [[0 0 7];[0 0 9];[0 5 9]];

grad.pnt = pnt(sel,:) .* 1.2;
grad.ori = pnt(sel,:);
grad.tra = eye(length(sel));
for i=1:length(sel)
  grad.ori(i,:) = grad.ori(i,:) ./ norm(grad.ori(i,:));
  grad.label{i} = sprintf('magnetometer%d', i);
end
grad.unit = 'cm';

bnd.pnt = pnt;
bnd.tri = tri;

bndpnt.pnt = pnt;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% test with different lead fields
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% first generate the head models
cfg=[];
cfg.conductivity = 1;
cfg.method = 'singlesphere';
eegvol_singlesphere = ft_prepare_headmodel(cfg, bndpnt);

cfg=[];
cfg.method = 'openmeeg';
eegvol_bem_openmeeg = ft_prepare_headmodel(cfg, bnd);

cfg=[];
cfg.method = 'dipoli';
eegvol_bem_dipoli = ft_prepare_headmodel(cfg, bnd);

cfg=[];
cfg.conductivity = 1;
cfg.grad = grad;
cfg.method = 'localspheres';
megvol_localspheres = ft_prepare_headmodel(cfg, bndpnt);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ..then the lead fields for EEG
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Without normalization
cfg = [];
cfg.vol  = eegvol_singlesphere;
cfg.elec = elec;
cfg.grid.pos = pos;
grid = ft_prepare_leadfield(cfg);
cfg = [];
cfg.vol  = eegvol_bem_openmeeg;
cfg.elec = elec;
cfg.grid.pos = pos;
grid = ft_prepare_leadfield(cfg);
cfg = [];
cfg.vol  = eegvol_bem_dipoli;
cfg.elec = elec;
cfg.grid.pos = pos;
grid = ft_prepare_leadfield(cfg);

% With normalization
cfg = [];
cfg.vol  = eegvol_singlesphere;
cfg.elec = elec;
cfg.grid.pos = pos;
cfg.normalize = 'yes';
grid = ft_prepare_leadfield(cfg);
cfg = [];
cfg.vol  = eegvol_bem_openmeeg;
cfg.elec = elec;
cfg.grid.pos = pos;
cfg.normalize = 'yes';
grid = ft_prepare_leadfield(cfg);

% check correctness of OM normalization
lf = grid.leadfield{grid.inside(1)};
if (abs(norm(lf,'fro')-1)>eps)
  error('test not passed for vector norm')
end

cfg = [];
cfg.vol  = eegvol_bem_dipoli;
cfg.elec = elec;
cfg.grid.pos = pos;
cfg.normalize = 'yes';
grid = ft_prepare_leadfield(cfg);
% With a different normalization
cfg = [];
cfg.vol  = eegvol_singlesphere;
cfg.elec = elec;
cfg.grid.pos = pos;
cfg.normalize = 'column';
grid = ft_prepare_leadfield(cfg);
cfg = [];
cfg.vol  = eegvol_bem_openmeeg;
cfg.elec = elec;
cfg.grid.pos = pos;
cfg.normalize = 'column';
grid = ft_prepare_leadfield(cfg);

% check correctness of OM normalization
lf = grid.leadfield{grid.inside(1)};
if (norm(lf(:,1),'fro')-1>eps)
  error('test not passed for column norm')
end

cfg = [];
cfg.vol  = eegvol_bem_dipoli;
cfg.elec = elec;
cfg.grid.pos = pos;
cfg.normalize = 'column';
grid = ft_prepare_leadfield(cfg);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ..then the lead fields for MEG
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Without normalization
cfg = [];
cfg.vol  = eegvol_singlesphere;
cfg.grad = grad;
cfg.grid.pos = pos;
grid = ft_prepare_leadfield(cfg);
cfg = [];
cfg.vol  = megvol_localspheres;
cfg.grad = grad;
cfg.grid.pos = pos;
grid = ft_prepare_leadfield(cfg);

% With normalization
cfg = [];
cfg.vol  = eegvol_singlesphere;
cfg.grad = grad;
cfg.grid.pos = pos;
cfg.normalize = 'yes';
grid = ft_prepare_leadfield(cfg);
cfg = [];
cfg.vol  = megvol_localspheres;
cfg.grad = grad;
cfg.grid.pos = pos;
cfg.normalize = 'yes';
grid = ft_prepare_leadfield(cfg);

% With a different normalization
cfg = [];
cfg.vol  = eegvol_singlesphere;
cfg.grad = grad;
cfg.grid.pos = pos;
cfg.normalize = 'column';
grid = ft_prepare_leadfield(cfg);
cfg = [];
cfg.vol  = megvol_localspheres;
cfg.grad = grad;
cfg.grid.pos = pos;
cfg.normalize = 'column';
grid = ft_prepare_leadfield(cfg);
