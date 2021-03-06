
%NOTE: make sure this compile option is included in the COMPFLAGS variable: 
%         /assume:byterecl 

NWTC_LIB    = 'C:\Users\bjonkman\Documents\DATA\DesignCodes\miscellaneous\nwtc_subs\SVNdirectory\trunk_V1\source';
WIND_LOC    = 'C:\Users\bjonkman\Documents\DATA\DesignCodes\simulators\InflowWind\SVNdirectory\trunk\Source';

OutputRootName = 'InflowWind_mex';

mex('-v', ...
    '-f','intelf12msvs2010shellopts.bat' , ...
    '-compatibleArrayDims'               , ... %use limited array handling (not large array dims)
    '-output', OutputRootName            , ...
    [NWTC_LIB '\DoubPrec.f90'           ], ... 
    [NWTC_LIB '\SysMatlab.f90'          ], ...
    [NWTC_LIB '\NWTC_IO.f90'            ], ...
    [NWTC_LIB '\NWTC_Num.f90'           ], ...
    [NWTC_LIB '\NWTC_Aero.f90'          ], ...
    [NWTC_LIB '\ModMesh.f90'            ], ...
    [NWTC_LIB '\NWTC_Library.f90'       ], ...
    [WIND_LOC '\SharedInflowDefs.f90'   ], ...
    [WIND_LOC '\HHWind.f90'             ], ...
    [WIND_LOC '\FFWind.f90'             ], ...
    [WIND_LOC '\HAWCWind.f90'           ], ...
    [WIND_LOC '\FDWind.f90'             ], ...
    [WIND_LOC '\CTWind.f90'             ], ...
    [WIND_LOC '\UserWind.f90'           ], ...
    [WIND_LOC '\InflowWindMod.f90'      ], ...
    'InflowWind_Gateway.f90'            );

delete ('*.mod')
disp(['mex completed: ' OutputRootName '.' mexext ' has been created.'])

