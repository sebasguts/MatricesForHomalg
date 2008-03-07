#############################################################################
##
##  Modules.gi                  homalg package               Mohamed Barakat
##
##  Copyright 2007-2008 Lehrstuhl B für Mathematik, RWTH Aachen
##
##  Implementations of homalg procedures for modules.
##
#############################################################################

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( \/,				### defines: SubfactorModule (incomplete)
        "for a homalg matrix",
	[ IsGeneratorsForHomalg, IsGeneratorsForHomalg ],
        
  function( M1, M2 )
    local R, RP, B, N, S;
    
    R := HomalgRing( M1 );
    
    RP := HomalgTable( R );
    
    if IsBound(RP!.SubfactorModule) then
        return RP!.SubfactorModule( M1, M2 );
    fi;
    
    #=====# begin of the core procedure #=====#
    
    # basis of M2
    B := BasisOfModule( M2 );
    
    # normal forms of generators of M1 with respect to B
    N := DecideZero( M1, B );
    
    if IsLeftGeneratorsForHomalgRep( M1 ) then
        N := CreateRelationsForLeftModule( N );
    else
        N := CreateRelationsForRightModule( N );
    fi;
    
    # get a better basis for N
    N := GetRidOfTrivialRelations( N );
    
    # compute the syzygies module of N modulo B
    S := SyzygiesGenerators( N, B );
    
    if IsLeftGeneratorsForHomalgRep( M1 ) then
        return Presentation( CreateRelationsForLeftModule( S ) );
    else
        return Presentation( CreateRelationsForRightModule( S ) );
    fi;
    
end );
