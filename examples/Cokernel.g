LoadPackage( "homalg" );
LoadPackage( "RingsForHomalg" );
HOMALG_IO.color_display := true;
Qxyz := HomalgFieldOfRationalsInMaple( ) * "x,y,z";
Display( Qxyz );
M := HomalgMatrix( " \
[ [x,y,z] ]\
", Qxyz );
M := LeftPresentation( M );
phi := HomalgMatrix( " \
[ [x^2,y^2,0], [1,0,z] ]\
", Qxyz );
F2 := HomalgFreeLeftModule( 2, Qxyz );
phi := HomalgMorphism( phi, F2, M );
N := Cokernel( phi );
BetterGenerators( N );
BasisOfModule( N );
psi := HomalgMatrix( "\
[[y,0],[0,z-1]]\
", Qxyz );
psi := HomalgMorphism( psi, F2, N );
C := Cokernel( psi );
BetterGenerators( C );
BasisOfModule( C );