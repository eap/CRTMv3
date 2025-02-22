!
! SpcCoeff_NC2BIN
!
! Program to convert netCDF format SpcCoeff files to the Binary format.
!
!
! CREATION HISTORY:
!       Written by:     Paul van Delst, 27-Jul-2002
!                       paul.vandelst@noaa.gov
!       Updated by:     Ben Johnson 23 January, 2024


PROGRAM SpcCoeff_NC2BIN

  ! ------------------
  ! Environment set up
  ! ------------------
  ! Module usage
  USE CRTM_Module
  USE Message_Handler   , ONLY: SUCCESS, FAILURE, Program_Message, Display_Message
  USE String_Utility    , ONLY: StrLowCase
  USE SpcCoeff_Define   , ONLY: SpcCoeff_type
  USE SpcCoeff_IO       , ONLY: SpcCoeff_netCDF_to_Binary
  ! Disable implicit typing
  IMPLICIT NONE


  ! ----------
  ! Parameters
  ! ----------
  CHARACTER(*), PARAMETER :: PROGRAM_NAME = 'SpcCoeff_NC2BIN'

  ! ---------
  ! Variables
  ! ---------
  INTEGER :: err_stat
  CHARACTER(256) :: msg, version_str
  CHARACTER(256) :: nc_filename
  CHARACTER(256) :: bin_filename, tmp_filename
  INTEGER :: n_args

  ! Program header
  CALL CRTM_Version (version_str)
  CALL Program_Message( PROGRAM_NAME, &
                        'Program to convert a CRTM SpcCoeff data file '//&
                        'from netCDF to Binary format.', &
                        'CRTM Version:'//trim(version_str) )
  
  ! Get the filename
  n_args = COMMAND_ARGUMENT_COUNT()
  IF ( n_args > 0 ) THEN
     CALL GET_COMMAND_ARGUMENT(1, nc_filename)
     !** automatically generate the binary filename based on the command line netcdf filename
     tmp_filename = nc_filename(1:LEN_TRIM(nc_filename) - 3)//".bin"
     bin_filename = TRIM(ADJUSTL(tmp_filename))  
     PRINT *, "Output filename:", bin_filename
  ELSE      
     ! Get the filenames
     WRITE(*,FMT='(/5x,"Enter the INPUT netCDF SpcCoeff filename : ")', ADVANCE='NO')
     READ(*,'(a)') nc_filename
     nc_filename = ADJUSTL(nc_filename)
     WRITE(*,FMT='(/5x,"Enter the OUTPUT Binary SpcCoeff filename: ")', ADVANCE='NO')
     READ(*,'(a)') bin_filename
     bin_filename = ADJUSTL(bin_filename)
     ! ...Sanity check that they're not the same
     IF ( bin_filename == nc_filename ) THEN
        msg = 'SpcCoeff netCDF and Binary filenames are the same!'
        CALL Display_Message( PROGRAM_NAME, msg, FAILURE ); STOP
     END IF
  END IF

  ! Perform the conversion (no change to version)
  err_stat = SpcCoeff_netCDF_to_Binary( nc_filename, bin_filename )
  IF ( err_stat /= SUCCESS ) THEN
    msg = 'SpcCoeff netCDF -> Binary conversion failed!'
    CALL Display_Message( PROGRAM_NAME, msg, FAILURE ); STOP
  ELSE
    msg = 'SpcCoeff netCDF -> Binary conversion successful!'
    CALL Display_Message( PROGRAM_NAME, msg, err_stat )
  END IF
  
  
END PROGRAM SpcCoeff_NC2BIN
