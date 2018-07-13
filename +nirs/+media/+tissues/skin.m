function prop = skin( lambda )
    
%     c = nirs.getSpectra( lambda );
    
%     mua = 7.9e-6 * .985 * c(:,1) + ...
%         7.9e-6 * (1-.985) * c(:,2) + ...
%         0.214 * c(:,3) + ...
%         0.277 * c(:,4) + ...
%         0.0087 * c(:,5);
    
%     mua = 4.7e-6 * .39 * c(:,1) + ...
%         4.7e-6 * (1-.39) * c(:,2) + ...
%         0.65 * c(:,3) + ...
%         0 * c(:,4) + ...
%         0.0087 * c(:,5);

% mus = 4.6 * (lambda/500).^-1.421;

    mua = [6.17950E+02	3.82747E-02
        6.19050E+02	3.74991E-02
        6.20160E+02	3.73146E-02
        6.21270E+02	3.69519E-02
        6.22380E+02	3.69538E-02
        6.23490E+02	3.63866E-02
        6.24600E+02	3.60982E-02
        6.25710E+02	3.56900E-02
        6.26810E+02	3.53262E-02
        6.27920E+02	3.49719E-02
        6.29030E+02	3.44983E-02
        6.30140E+02	3.46253E-02
        6.31250E+02	3.41215E-02
        6.32360E+02	3.36680E-02
        6.33470E+02	3.34158E-02
        6.34570E+02	3.30555E-02
        6.35680E+02	3.26584E-02
        6.36790E+02	3.23476E-02
        6.37900E+02	3.20018E-02
        6.39010E+02	3.16900E-02
        6.40120E+02	3.14530E-02
        6.41230E+02	3.09834E-02
        6.42340E+02	3.07655E-02
        6.43440E+02	3.04192E-02
        6.44550E+02	3.01468E-02
        6.45660E+02	2.98381E-02
        6.46770E+02	2.95181E-02
        6.47880E+02	2.93311E-02
        6.48990E+02	2.88947E-02
        6.50100E+02	2.87608E-02
        6.51210E+02	2.82819E-02
        6.52320E+02	2.80112E-02
        6.53420E+02	2.78938E-02
        6.54530E+02	2.75605E-02
        6.55640E+02	2.72027E-02
        6.56750E+02	2.69820E-02
        6.57860E+02	2.67523E-02
        6.58970E+02	2.65179E-02
        6.60080E+02	2.62238E-02
        6.61190E+02	2.59718E-02
        6.62300E+02	2.57312E-02
        6.63410E+02	2.53853E-02
        6.64510E+02	2.51101E-02
        6.65620E+02	2.50483E-02
        6.66730E+02	2.47866E-02
        6.67840E+02	2.44447E-02
        6.68950E+02	2.42818E-02
        6.70060E+02	2.40140E-02
        6.71170E+02	2.38731E-02
        6.72280E+02	2.37247E-02
        6.73390E+02	2.35325E-02
        6.74500E+02	2.32080E-02
        6.75610E+02	2.31533E-02
        6.76710E+02	2.27829E-02
        6.77820E+02	2.26953E-02
        6.78930E+02	2.23362E-02
        6.80040E+02	2.23844E-02
        6.81150E+02	2.20832E-02
        6.82260E+02	2.18870E-02
        6.83370E+02	2.17133E-02
        6.84480E+02	2.15800E-02
        6.85590E+02	2.13001E-02
        6.86700E+02	2.12199E-02
        6.87810E+02	2.10340E-02
        6.88920E+02	2.07785E-02
        6.90030E+02	2.06013E-02
        6.91140E+02	2.05090E-02
        6.92250E+02	2.03596E-02
        6.93350E+02	2.01539E-02
        6.94460E+02	1.99855E-02
        6.95570E+02	1.98683E-02
        6.96680E+02	1.96162E-02
        6.97790E+02	1.95442E-02
        6.98900E+02	1.93897E-02
        7.00010E+02	1.91349E-02
        7.01120E+02	1.90188E-02
        7.02230E+02	1.90394E-02
        7.03340E+02	1.89175E-02
        7.04450E+02	1.88247E-02
        7.05560E+02	1.86971E-02
        7.06670E+02	1.85286E-02
        7.07780E+02	1.85037E-02
        7.08890E+02	1.83153E-02
        7.10000E+02	1.82561E-02
        7.11110E+02	1.81691E-02
        7.12220E+02	1.80792E-02
        7.13330E+02	1.80318E-02
        7.14440E+02	1.78331E-02
        7.15550E+02	1.78248E-02
        7.16660E+02	1.77868E-02
        7.17770E+02	1.75696E-02
        7.18880E+02	1.75443E-02
        7.19990E+02	1.74974E-02
        7.21100E+02	1.74396E-02
        7.22210E+02	1.73010E-02
        7.23320E+02	1.72743E-02
        7.24420E+02	1.71888E-02
        7.25530E+02	1.72162E-02
        7.26640E+02	1.71937E-02
        7.27750E+02	1.71186E-02
        7.28860E+02	1.70307E-02
        7.29970E+02	1.69822E-02
        7.31080E+02	1.68776E-02
        7.32190E+02	1.69872E-02
        7.33300E+02	1.68806E-02
        7.34410E+02	1.69381E-02
        7.35520E+02	1.68652E-02
        7.36630E+02	1.68406E-02
        7.37740E+02	1.68911E-02
        7.38850E+02	1.69365E-02
        7.39960E+02	1.67582E-02
        7.41070E+02	1.67351E-02
        7.42180E+02	1.67333E-02
        7.43290E+02	1.67263E-02
        7.44400E+02	1.66275E-02
        7.45510E+02	1.66530E-02
        7.46620E+02	1.66160E-02
        7.47730E+02	1.65860E-02
        7.48840E+02	1.64659E-02
        7.49950E+02	1.64808E-02
        7.51070E+02	1.64060E-02
        7.52180E+02	1.63952E-02
        7.53290E+02	1.63258E-02
        7.54400E+02	1.63181E-02
        7.55510E+02	1.62166E-02
        7.56620E+02	1.62190E-02
        7.57730E+02	1.60806E-02
        7.58840E+02	1.60292E-02
        7.59950E+02	1.59293E-02
        7.61060E+02	1.58848E-02
        7.62170E+02	1.57700E-02
        7.63280E+02	1.56958E-02
        7.64390E+02	1.55917E-02
        7.65500E+02	1.55220E-02
        7.66610E+02	1.53503E-02
        7.67720E+02	1.52702E-02
        7.68830E+02	1.52134E-02
        7.69940E+02	1.50587E-02
        7.71050E+02	1.50349E-02
        7.72160E+02	1.48765E-02
        7.73270E+02	1.48086E-02
        7.74380E+02	1.47012E-02
        7.75490E+02	1.45514E-02
        7.76600E+02	1.45386E-02
        7.77710E+02	1.43992E-02
        7.78820E+02	1.43262E-02
        7.79930E+02	1.41794E-02
        7.81040E+02	1.40214E-02
        7.82160E+02	1.39683E-02
        7.83270E+02	1.37990E-02
        7.84380E+02	1.37756E-02
        7.85490E+02	1.36181E-02
        7.86600E+02	1.36817E-02
        7.87710E+02	1.35545E-02
        7.88820E+02	1.34658E-02
        7.89930E+02	1.33316E-02
        7.91040E+02	1.32758E-02
        7.92150E+02	1.32115E-02
        7.93260E+02	1.31656E-02
        7.94370E+02	1.30798E-02
        7.95480E+02	1.30530E-02
        7.96590E+02	1.29150E-02
        7.97700E+02	1.28162E-02
        7.98810E+02	1.29098E-02
        7.99930E+02	1.27221E-02
        8.01040E+02	1.27290E-02
        8.02150E+02	1.26700E-02
        8.03260E+02	1.25720E-02
        8.04370E+02	1.25047E-02
        8.05480E+02	1.24168E-02
        8.06590E+02	1.24777E-02
        8.07700E+02	1.24211E-02
        8.08810E+02	1.23446E-02
        8.09920E+02	1.22852E-02
        8.11030E+02	1.21507E-02
        8.12140E+02	1.22403E-02
        8.13260E+02	1.21411E-02
        8.14370E+02	1.21483E-02
        8.15480E+02	1.21593E-02
        8.16590E+02	1.20859E-02
        8.17700E+02	1.20854E-02
        8.18810E+02	1.21277E-02
        8.19920E+02	1.21170E-02
        8.21030E+02	1.20609E-02
        8.22140E+02	1.21458E-02
        8.23250E+02	1.21050E-02
        8.24360E+02	1.20609E-02
        8.25480E+02	1.25184E-02
        8.26590E+02	1.20945E-02
        8.27700E+02	1.21045E-02
        8.28810E+02	1.21404E-02
        8.29920E+02	1.21845E-02
        8.31030E+02	1.22061E-02
        8.32140E+02	1.22504E-02
        8.33250E+02	1.21336E-02
        8.34360E+02	1.20951E-02
        8.35480E+02	1.22199E-02
        8.36590E+02	1.22643E-02
        8.37700E+02	1.22437E-02
        8.38810E+02	1.22136E-02
        8.39920E+02	1.23578E-02
        8.41030E+02	1.23132E-02
        8.42140E+02	1.21520E-02
        8.43250E+02	1.22691E-02
        8.44370E+02	1.21837E-02
        8.45480E+02	1.22306E-02
        8.46590E+02	1.21595E-02
        8.47700E+02	1.23331E-02
        8.48810E+02	1.21937E-02
        8.49920E+02	1.22336E-02
        8.51030E+02	1.22226E-02
        8.52140E+02	1.22010E-02
        8.53260E+02	1.21012E-02
        8.54370E+02	1.21581E-02
        8.55480E+02	1.21080E-02
        8.56590E+02	1.20693E-02
        8.57700E+02	1.21691E-02
        8.58810E+02	1.20276E-02
        8.59920E+02	1.20198E-02
        8.61040E+02	1.21284E-02
        8.62150E+02	1.21390E-02
        8.63260E+02	1.21023E-02
        8.64370E+02	1.21121E-02
        8.65480E+02	1.21397E-02
        8.66590E+02	1.20927E-02
        8.67700E+02	1.20350E-02
        8.68820E+02	1.20392E-02
        8.69930E+02	1.21789E-02
        8.71040E+02	1.22400E-02
        8.72150E+02	1.21844E-02
        8.73260E+02	1.23456E-02
        8.74370E+02	1.22437E-02
        8.75480E+02	1.22291E-02
        8.76600E+02	1.22859E-02
        8.77710E+02	1.23115E-02
        8.78820E+02	1.24062E-02
        8.79930E+02	1.24540E-02
        8.81040E+02	1.24976E-02
        8.82150E+02	1.25022E-02
        8.83270E+02	1.25929E-02
        8.84380E+02	1.26689E-02
        8.85490E+02	1.26308E-02
        8.86600E+02	1.27318E-02
        8.87710E+02	1.27576E-02
        8.88820E+02	1.28515E-02
        8.89940E+02	1.28292E-02
        8.91050E+02	1.28417E-02
        8.92160E+02	1.28952E-02
        8.93270E+02	1.31173E-02
        8.94380E+02	1.29439E-02
        8.95490E+02	1.32239E-02
        8.96610E+02	1.33980E-02
        8.97720E+02	1.33524E-02
        8.98830E+02	1.31299E-02
        8.99940E+02	1.34000E-02
        9.01050E+02	1.34999E-02
        9.02170E+02	1.36062E-02
        9.03280E+02	1.37722E-02
        9.04390E+02	1.36968E-02
        9.05500E+02	1.38706E-02
        9.06610E+02	1.38429E-02
        9.07730E+02	1.38313E-02
        9.08840E+02	1.40521E-02
        9.09950E+02	1.39622E-02
        9.11060E+02	1.41335E-02
        9.12170E+02	1.42196E-02
        9.13280E+02	1.43138E-02
        9.14400E+02	1.42631E-02
        9.15510E+02	1.45800E-02
        9.16620E+02	1.46008E-02
        9.17730E+02	1.48413E-02
        9.18840E+02	1.48365E-02
        9.19960E+02	1.50496E-02
        9.21070E+02	1.51683E-02
        9.22180E+02	1.49822E-02
        9.23290E+02	1.53551E-02
        9.24410E+02	1.53908E-02
        9.25520E+02	1.55467E-02
        9.26630E+02	1.55181E-02
        9.27740E+02	1.60155E-02
        9.28850E+02	1.62778E-02
        9.29970E+02	1.62018E-02
        9.31080E+02	1.66548E-02
        9.32190E+02	1.64827E-02
        9.33300E+02	1.67744E-02
        9.34410E+02	1.71287E-02
        9.35530E+02	1.70759E-02
        9.36640E+02	1.77808E-02
        9.37750E+02	1.85318E-02
        9.38860E+02	1.87139E-02
        9.39980E+02	1.90506E-02
        9.41090E+02	1.95759E-02
        9.42200E+02	2.03178E-02
        9.43310E+02	2.07747E-02
        9.44420E+02	2.13631E-02
        9.45540E+02	2.26013E-02
        9.46650E+02	2.36240E-02
        9.47760E+02	2.43412E-02
        9.48870E+02	2.55399E-02
        9.49990E+02	2.62860E-02
        9.51100E+02	2.75145E-02
        9.52210E+02	2.82512E-02
        9.53320E+02	2.93599E-02
        9.54440E+02	2.95373E-02
        9.55550E+02	3.09462E-02
        9.56660E+02	3.14729E-02
        9.57770E+02	3.17913E-02
        9.58880E+02	3.24979E-02
        9.60000E+02	3.39210E-02
        9.61110E+02	3.44063E-02
        9.62220E+02	3.46393E-02
        9.63330E+02	3.49915E-02
        9.64450E+02	3.44136E-02
        9.65560E+02	3.50457E-02
        9.66670E+02	3.57917E-02
        9.67780E+02	3.61024E-02
        9.68900E+02	3.67028E-02
        9.70010E+02	3.74098E-02
        9.71120E+02	3.69821E-02
        9.72230E+02	3.69434E-02
        9.73350E+02	3.68198E-02
        9.74460E+02	3.71263E-02
        9.75570E+02	3.71690E-02
        9.76680E+02	3.71385E-02
        9.77800E+02	3.76436E-02
        9.78910E+02	3.85022E-02
        9.80020E+02	3.74070E-02
        9.81140E+02	3.74546E-02
        9.82250E+02	3.76110E-02
        9.83360E+02	3.72619E-02
        9.84470E+02	3.66271E-02
        9.85590E+02	3.64967E-02
        9.86700E+02	3.67356E-02
        9.87810E+02	3.65166E-02
        9.88920E+02	3.63351E-02
        9.90040E+02	3.51541E-02
        9.91150E+02	3.56951E-02
        9.92260E+02	3.56184E-02
        9.93370E+02	3.52360E-02
        9.94490E+02	3.50141E-02
        9.95600E+02	3.48386E-02
        9.96710E+02	3.46001E-02
        9.97830E+02	3.42817E-02
        9.98940E+02	3.36635E-02
        1.00005E+03	3.34372E-02
        1.00116E+03	3.34013E-02
        1.00228E+03	3.58201E-02
        1.00339E+03	3.21074E-02
        1.00450E+03	3.20219E-02];

    mus = [ 	 
        6.179500E+02	2.804476E+00
        6.190500E+02	2.782311E+00
        6.201600E+02	2.786873E+00
        6.212700E+02	2.776581E+00
        6.223800E+02	2.789603E+00
        6.234900E+02	2.773485E+00
        6.246000E+02	2.772889E+00
        6.257100E+02	2.758568E+00
        6.268100E+02	2.762015E+00
        6.279200E+02	2.755117E+00
        6.290300E+02	2.748814E+00
        6.301400E+02	2.754316E+00
        6.312500E+02	2.737491E+00
        6.323600E+02	2.736532E+00
        6.334700E+02	2.729982E+00
        6.345700E+02	2.721769E+00
        6.356800E+02	2.710191E+00
        6.367900E+02	2.699827E+00
        6.379000E+02	2.692554E+00
        6.390100E+02	2.687672E+00
        6.401200E+02	2.675084E+00
        6.412300E+02	2.670474E+00
        6.423400E+02	2.664603E+00
        6.434400E+02	2.655674E+00
        6.445500E+02	2.651321E+00
        6.456600E+02	2.648769E+00
        6.467700E+02	2.638842E+00
        6.478800E+02	2.632177E+00
        6.489900E+02	2.622365E+00
        6.501000E+02	2.624710E+00
        6.512100E+02	2.608522E+00
        6.523200E+02	2.606032E+00
        6.534200E+02	2.601711E+00
        6.545300E+02	2.594919E+00
        6.556400E+02	2.588345E+00
        6.567500E+02	2.582675E+00
        6.578600E+02	2.576998E+00
        6.589700E+02	2.569186E+00
        6.600800E+02	2.561983E+00
        6.611900E+02	2.553987E+00
        6.623000E+02	2.546074E+00
        6.634100E+02	2.544119E+00
        6.645100E+02	2.540612E+00
        6.656200E+02	2.532945E+00
        6.667300E+02	2.518637E+00
        6.678400E+02	2.519540E+00
        6.689500E+02	2.512531E+00
        6.700600E+02	2.499191E+00
        6.711700E+02	2.497416E+00
        6.722800E+02	2.493427E+00
        6.733900E+02	2.481306E+00
        6.745000E+02	2.481103E+00
        6.756100E+02	2.472029E+00
        6.767100E+02	2.465017E+00
        6.778200E+02	2.455542E+00
        6.789300E+02	2.450612E+00
        6.800400E+02	2.439486E+00
        6.811500E+02	2.435986E+00
        6.822600E+02	2.429537E+00
        6.833700E+02	2.418926E+00
        6.844800E+02	2.411920E+00
        6.855900E+02	2.400782E+00
        6.867000E+02	2.395193E+00
        6.878100E+02	2.385993E+00
        6.889200E+02	2.379943E+00
        6.900300E+02	2.369350E+00
        6.911400E+02	2.368256E+00
        6.922500E+02	2.362074E+00
        6.933500E+02	2.355987E+00
        6.944600E+02	2.347731E+00
        6.955700E+02	2.340726E+00
        6.966800E+02	2.338101E+00
        6.977900E+02	2.329402E+00
        6.989000E+02	2.327360E+00
        7.000100E+02	2.317025E+00
        7.011200E+02	2.313118E+00
        7.022300E+02	2.309613E+00
        7.033400E+02	2.304914E+00
        7.044500E+02	2.293243E+00
        7.055600E+02	2.294122E+00
        7.066700E+02	2.287203E+00
        7.077800E+02	2.280114E+00
        7.088900E+02	2.272609E+00
        7.100000E+02	2.269820E+00
        7.111100E+02	2.262624E+00
        7.122200E+02	2.261568E+00
        7.133300E+02	2.255647E+00
        7.144400E+02	2.249010E+00
        7.155500E+02	2.247223E+00
        7.166600E+02	2.241341E+00
        7.177700E+02	2.233512E+00
        7.188800E+02	2.231572E+00
        7.199900E+02	2.223857E+00
        7.211000E+02	2.221207E+00
        7.222100E+02	2.216896E+00
        7.233200E+02	2.210816E+00
        7.244200E+02	2.206557E+00
        7.255300E+02	2.199369E+00
        7.266400E+02	2.196978E+00
        7.277500E+02	2.191461E+00
        7.288600E+02	2.185976E+00
        7.299700E+02	2.181396E+00
        7.310800E+02	2.176614E+00
        7.321900E+02	2.167508E+00
        7.333000E+02	2.168023E+00
        7.344100E+02	2.159437E+00
        7.355200E+02	2.157387E+00
        7.366300E+02	2.151508E+00
        7.377400E+02	2.146296E+00
        7.388500E+02	2.147494E+00
        7.399600E+02	2.135081E+00
        7.410700E+02	2.133500E+00
        7.421800E+02	2.130632E+00
        7.432900E+02	2.126062E+00
        7.444000E+02	2.121286E+00
        7.455100E+02	2.116315E+00
        7.466200E+02	2.113965E+00
        7.477300E+02	2.109470E+00
        7.488400E+02	2.104674E+00
        7.499500E+02	2.096540E+00
        7.510700E+02	2.093477E+00
        7.521800E+02	2.088059E+00
        7.532900E+02	2.084103E+00
        7.544000E+02	2.075082E+00
        7.555100E+02	2.073006E+00
        7.566200E+02	2.066597E+00
        7.577300E+02	2.059943E+00
        7.588400E+02	2.050771E+00
        7.599500E+02	2.052793E+00
        7.610600E+02	2.046192E+00
        7.621700E+02	2.039520E+00
        7.632800E+02	2.039127E+00
        7.643900E+02	2.033410E+00
        7.655000E+02	2.028590E+00
        7.666100E+02	2.023433E+00
        7.677200E+02	2.018158E+00
        7.688300E+02	2.015673E+00
        7.699400E+02	2.010486E+00
        7.710500E+02	2.004667E+00
        7.721600E+02	2.001151E+00
        7.732700E+02	1.996493E+00
        7.743800E+02	1.991552E+00
        7.754900E+02	1.991228E+00
        7.766000E+02	1.983962E+00
        7.777100E+02	1.981961E+00
        7.788200E+02	1.978924E+00
        7.799300E+02	1.973605E+00
        7.810400E+02	1.971723E+00
        7.821600E+02	1.966918E+00
        7.832700E+02	1.959196E+00
        7.843800E+02	1.956250E+00
        7.854900E+02	1.956039E+00
        7.866000E+02	1.948134E+00
        7.877100E+02	1.947708E+00
        7.888200E+02	1.946083E+00
        7.899300E+02	1.939411E+00
        7.910400E+02	1.934504E+00
        7.921500E+02	1.932282E+00
        7.932600E+02	1.926558E+00
        7.943700E+02	1.927380E+00
        7.954800E+02	1.921991E+00
        7.965900E+02	1.918347E+00
        7.977000E+02	1.914908E+00
        7.988100E+02	1.909890E+00
        7.999300E+02	1.906934E+00
        8.010400E+02	1.907586E+00
        8.021500E+02	1.903756E+00
        8.032600E+02	1.898789E+00
        8.043700E+02	1.895060E+00
        8.054800E+02	1.892055E+00
        8.065900E+02	1.890330E+00
        8.077000E+02	1.884508E+00
        8.088100E+02	1.882717E+00
        8.099200E+02	1.881389E+00
        8.110300E+02	1.875087E+00
        8.121400E+02	1.874747E+00
        8.132600E+02	1.866043E+00
        8.143700E+02	1.860845E+00
        8.154800E+02	1.858832E+00
        8.165900E+02	1.856751E+00
        8.177000E+02	1.856530E+00
        8.188100E+02	1.846771E+00
        8.199200E+02	1.844396E+00
        8.210300E+02	1.840763E+00
        8.221400E+02	1.837014E+00
        8.232500E+02	1.835255E+00
        8.243600E+02	1.832953E+00
        8.254800E+02	1.823857E+00
        8.265900E+02	1.822585E+00
        8.277000E+02	1.823145E+00
        8.288100E+02	1.819513E+00
        8.299200E+02	1.812666E+00
        8.310300E+02	1.812612E+00
        8.321400E+02	1.805838E+00
        8.332500E+02	1.804484E+00
        8.343600E+02	1.799403E+00
        8.354800E+02	1.799565E+00
        8.365900E+02	1.789897E+00
        8.377000E+02	1.786282E+00
        8.388100E+02	1.786909E+00
        8.399200E+02	1.781412E+00
        8.410300E+02	1.778656E+00
        8.421400E+02	1.776392E+00
        8.432500E+02	1.772730E+00
        8.443700E+02	1.767589E+00
        8.454800E+02	1.764889E+00
        8.465900E+02	1.767508E+00
        8.477000E+02	1.763352E+00
        8.488100E+02	1.759657E+00
        8.499200E+02	1.757397E+00
        8.510300E+02	1.756716E+00
        8.521400E+02	1.751126E+00
        8.532600E+02	1.746596E+00
        8.543700E+02	1.746455E+00
        8.554800E+02	1.745621E+00
        8.565900E+02	1.736241E+00
        8.577000E+02	1.738276E+00
        8.588100E+02	1.732828E+00
        8.599200E+02	1.727444E+00
        8.610400E+02	1.727666E+00
        8.621500E+02	1.724934E+00
        8.632600E+02	1.722180E+00
        8.643700E+02	1.718165E+00
        8.654800E+02	1.717719E+00
        8.665900E+02	1.716333E+00
        8.677000E+02	1.714179E+00
        8.688200E+02	1.710092E+00
        8.699300E+02	1.707850E+00
        8.710400E+02	1.704395E+00
        8.721500E+02	1.700749E+00
        8.732600E+02	1.699707E+00
        8.743700E+02	1.699315E+00
        8.754800E+02	1.698353E+00
        8.766000E+02	1.691656E+00
        8.777100E+02	1.691524E+00
        8.788200E+02	1.685988E+00
        8.799300E+02	1.680659E+00
        8.810400E+02	1.680976E+00
        8.821500E+02	1.679315E+00
        8.832700E+02	1.672076E+00
        8.843800E+02	1.671232E+00
        8.854900E+02	1.671995E+00
        8.866000E+02	1.669183E+00
        8.877100E+02	1.666534E+00
        8.888200E+02	1.661023E+00
        8.899400E+02	1.652321E+00
        8.910500E+02	1.654896E+00
        8.921600E+02	1.652158E+00
        8.932700E+02	1.652861E+00
        8.943800E+02	1.643351E+00
        8.954900E+02	1.645414E+00
        8.966100E+02	1.642612E+00
        8.977200E+02	1.639969E+00
        8.988300E+02	1.637623E+00
        8.999400E+02	1.630175E+00
        9.010500E+02	1.637224E+00
        9.021700E+02	1.632354E+00
        9.032800E+02	1.628980E+00
        9.043900E+02	1.622855E+00
        9.055000E+02	1.625644E+00
        9.066100E+02	1.621423E+00
        9.077300E+02	1.621145E+00
        9.088400E+02	1.615043E+00
        9.099500E+02	1.613813E+00
        9.110600E+02	1.612874E+00
        9.121700E+02	1.607371E+00
        9.132800E+02	1.610944E+00
        9.144000E+02	1.604198E+00
        9.155100E+02	1.602910E+00
        9.166200E+02	1.602453E+00
        9.177300E+02	1.597295E+00
        9.188400E+02	1.595936E+00
        9.199600E+02	1.597877E+00
        9.210700E+02	1.604656E+00
        9.221800E+02	1.595759E+00
        9.232900E+02	1.587380E+00
        9.244100E+02	1.589970E+00
        9.255200E+02	1.586944E+00
        9.266300E+02	1.578046E+00
        9.277400E+02	1.587247E+00
        9.288500E+02	1.582098E+00
        9.299700E+02	1.575438E+00
        9.310800E+02	1.583893E+00
        9.321900E+02	1.570916E+00
        9.333000E+02	1.574694E+00
        9.344100E+02	1.576528E+00
        9.355300E+02	1.568554E+00
        9.366400E+02	1.572555E+00
        9.377500E+02	1.576304E+00
        9.388600E+02	1.574113E+00
        9.399800E+02	1.567992E+00
        9.410900E+02	1.559251E+00
        9.422000E+02	1.558747E+00
        9.433100E+02	1.560843E+00
        9.444200E+02	1.556676E+00
        9.455400E+02	1.559513E+00
        9.466500E+02	1.558476E+00
        9.477600E+02	1.553554E+00
        9.488700E+02	1.540674E+00
        9.499900E+02	1.543099E+00
        9.511000E+02	1.548058E+00
        9.522100E+02	1.545054E+00
        9.533200E+02	1.545196E+00
        9.544400E+02	1.537353E+00
        9.555500E+02	1.527335E+00
        9.566600E+02	1.528510E+00
        9.577700E+02	1.531608E+00
        9.588800E+02	1.531910E+00
        9.600000E+02	1.525939E+00
        9.611100E+02	1.529845E+00
        9.622200E+02	1.521082E+00
        9.633300E+02	1.526260E+00
        9.644500E+02	1.516567E+00
        9.655600E+02	1.519641E+00
        9.666700E+02	1.512164E+00
        9.677800E+02	1.519095E+00
        9.689000E+02	1.518749E+00
        9.700100E+02	1.510846E+00
        9.711200E+02	1.514823E+00
        9.722300E+02	1.513457E+00
        9.733500E+02	1.508690E+00
        9.744600E+02	1.507732E+00
        9.755700E+02	1.508385E+00
        9.766800E+02	1.503943E+00
        9.778000E+02	1.508021E+00
        9.789100E+02	1.513203E+00
        9.800200E+02	1.500367E+00
        9.811400E+02	1.501633E+00
        9.822500E+02	1.498669E+00
        9.833600E+02	1.498545E+00
        9.844700E+02	1.497014E+00
        9.855900E+02	1.489179E+00
        9.867000E+02	1.489456E+00
        9.878100E+02	1.487244E+00
        9.889200E+02	1.491774E+00
        9.900400E+02	1.483079E+00
        9.911500E+02	1.495005E+00
        9.922600E+02	1.479669E+00
        9.933700E+02	1.481107E+00
        9.944900E+02	1.480625E+00
        9.956000E+02	1.479497E+00
        9.967100E+02	1.481645E+00
        9.978300E+02	1.480555E+00
        9.989400E+02	1.477011E+00
        1.000050E+03	1.476648E+00
        1.001160E+03	1.480107E+00
        1.002280E+03	1.504702E+00
        1.003390E+03	1.466151E+00
        1.004500E+03	1.468495E+00];

        mua = interp1(mua(:,1),mua(:,2),lambda);
        mus = interp1(mus(:,1),mus(:,2),lambda);
        ri = 1.45;
        
        prop = nirs.media.OpticalProp(mua,mus,lambda,ri);
end

