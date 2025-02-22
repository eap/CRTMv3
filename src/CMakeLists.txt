# (C) Copyright 2017-2020 UCAR.
#
# This software is licensed under the terms of the Apache Licence Version 2.0
# which can be obtained at http://www.apache.org/licenses/LICENSE-2.0.

include(GNUInstallDirs)
list( APPEND crtm_src_files
      Ancillary/CRTM_AncillaryInput_Define.f90
      AntennaCorrection/CRTM_AntennaCorrection.f90
      AtmAbsorption/CRTM_AtmAbsorption.f90
      AtmAbsorption/CRTM_Predictor_Define.f90
      AtmAbsorption/CRTM_Predictor.f90
      AtmAbsorption/ODAS/ODAS_AtmAbsorption.f90
      AtmAbsorption/ODAS/ODAS_Predictor_Define.f90
      AtmAbsorption/ODAS/ODAS_Predictor.f90
      AtmAbsorption/ODPS/ODPS_AtmAbsorption.f90
      AtmAbsorption/ODPS/ODPS_CoordinateMapping.f90
      AtmAbsorption/ODPS/ODPS_Predictor_Define.f90
      AtmAbsorption/ODPS/ODPS_Predictor.f90
      AtmAbsorption/ODPS/PAFV_Define.f90
      AtmAbsorption/ODSSU/ODSSU_AtmAbsorption.f90
      AtmAbsorption/ODZeeman/ODZeeman_AtmAbsorption.f90
      AtmAbsorption/ODZeeman/ODZeeman_Predictor.f90
      AtmOptics/AOvar_Define.f90
      AtmOptics/CRTM_AtmOptics_Define.f90
      AtmOptics/CRTM_AtmOptics.f90
      Atmosphere/Aerosol/CRTM_Aerosol_Define.f90
      Atmosphere/Cloud/CRTM_CloudCover_Define.f90
      Atmosphere/Cloud/CRTM_Cloud_Define.f90
      Atmosphere/CRTM_Atmosphere_Define.f90
      Atmosphere/CRTM_Hypsometric.f90
      Atmosphere/CRTM_Relative_Humidity.f90
      Atmosphere/CRTM_Atmosphere.f90
      Atmosphere/CRTM_Model_Profiles.f90
      Atmosphere/iAtm_Define.f90
      AtmScatter/AerosolScatter/ASvar_Define.f90
      AtmScatter/CloudScatter/CSvar_Define.f90
      AtmScatter/CRTM_AerosolScatter.f90
      AtmScatter/CRTM_AOD_Module.f90
      AtmScatter/CRTM_CloudScatter.f90
      AtmScatter/CRTM_MoleculeScatter.f90
      ChannelInfo/CRTM_ChannelInfo_Define.f90
      Coefficients/ACCoeff/ACCoeff_Binary_IO.f90
      Coefficients/ACCoeff/ACCoeff_netCDF_IO.f90
      Coefficients/ACCoeff/ACCoeff_Define.f90
      Coefficients/AerosolCoeff/AerosolCoeff_Binary_IO.f90
      Coefficients/AerosolCoeff/AerosolCoeff_Define.f90
      Coefficients/AerosolCoeff/AerosolCoeff_netCDF_IO.f90
      Coefficients/AerosolCoeff/AerosolCoeff_IO.f90
      Coefficients/CloudCoeff/CloudCoeff_Binary_IO.f90
      Coefficients/CloudCoeff/CloudCoeff_Define.f90
      Coefficients/CloudCoeff/CloudCoeff_netCDF_IO.f90
      Coefficients/CloudCoeff/CloudCoeff_IO.f90
      Coefficients/CRTM_AerosolCoeff.f90
      Coefficients/CRTM_CloudCoeff.f90
      Coefficients/CRTM_IRiceCoeff.f90
      Coefficients/CRTM_IRlandCoeff.f90
      Coefficients/CRTM_IRsnowCoeff.f90
      Coefficients/CRTM_IRwaterCoeff.f90
      Coefficients/CRTM_MWwaterCoeff.f90
      Coefficients/CRTM_SpcCoeff.f90
      Coefficients/CRTM_TauCoeff.f90
      Coefficients/CRTM_VISiceCoeff.f90
      Coefficients/CRTM_VISlandCoeff.f90
      Coefficients/CRTM_VISsnowCoeff.f90
      Coefficients/CRTM_VISwaterCoeff.f90
      Coefficients/EmisCoeff/IR_Land/LSEatlas/LSEatlas_Define.f90
      Coefficients/EmisCoeff/IR_Water/IRwaterCoeff_Define.f90
      Coefficients/EmisCoeff/IR_Water/IRwaterCoeff_IO.f90
      Coefficients/EmisCoeff/IR_Water/IRwaterCoeff_netCDF_IO.f90
      Coefficients/EmisCoeff/IR_Snow/IRsnowCoeff_Define.f90
      Coefficients/EmisCoeff/IR_Snow/IRsnowCoeff_IO.f90
      Coefficients/EmisCoeff/IR_Snow/IRsnowCoeff_Binary_IO.f90
      Coefficients/EmisCoeff/IR_Snow/IRsnowCoeff_netCDF_IO.f90
      Coefficients/EmisCoeff/MW_Water/MWwaterCoeff_Define.f90
      Coefficients/EmisCoeff/MW_Water/MWwaterLUT/MWwaterLUT_Define.f90
      Coefficients/EmisCoeff/SEcategory/SEcategory_Define.f90
      Coefficients/EmisCoeff/SEcategory/SEcategory_IO.f90
      Coefficients/EmisCoeff/SEcategory/SEcategory_netCDF_IO.f90
      Coefficients/FitCoeff/FitCoeff_Define.f90
      Coefficients/FitCoeff/FitCoeff_Destroy.inc
      Coefficients/FitCoeff/FitCoeff_Equal.inc
      Coefficients/FitCoeff/FitCoeff_Info.inc
      Coefficients/FitCoeff/FitCoeff_ReadFile.inc
      Coefficients/FitCoeff/FitCoeff_SetValue.inc
      Coefficients/FitCoeff/FitCoeff_WriteFile.inc
      Coefficients/NLTECoeff/NLTECoeff_Binary_IO.f90
      Coefficients/NLTECoeff/NLTECoeff_netCDF_IO.f90
      Coefficients/NLTECoeff/NLTECoeff_Define.f90
      Coefficients/SpcCoeff/SpcCoeff_Binary_IO.f90
      Coefficients/SpcCoeff/SpcCoeff_Define.f90
      Coefficients/SpcCoeff/SpcCoeff_IO.f90
      Coefficients/SpcCoeff/SpcCoeff_netCDF_IO.f90
      Coefficients/TauCoeff/ODAS/ODAS_Binary_IO.f90
      Coefficients/TauCoeff/ODAS/ODAS_netCDF_IO.f90
      Coefficients/TauCoeff/ODAS/ODAS_Define.f90
      Coefficients/TauCoeff/ODAS/ODAS_TauCoeff.f90
      Coefficients/TauCoeff/ODPS/ODPS_Binary_IO.f90
      Coefficients/TauCoeff/ODPS/ODPS_netCDF_IO.f90
      Coefficients/TauCoeff/ODPS/ODPS_Define.f90
      Coefficients/TauCoeff/ODPS/ODPS_TauCoeff.f90
      Coefficients/TauCoeff/ODSSU/ODSSU_Binary_IO.f90
      Coefficients/TauCoeff/ODSSU/ODSSU_Define.f90
      Coefficients/TauCoeff/ODSSU/ODSSU_TauCoeff.f90
      Coefficients/TauCoeff/ODZeeman/ODZeeman_TauCoeff.f90
      Coefficients/TauCoeff/TauCoeff_Define.f90
      CRTM_Adjoint_Module.f90
      CRTM_Forward_Module.f90
      CRTM_K_Matrix_Module.f90
      CRTM_LifeCycle.f90
      CRTM_Module.F90
      CRTM_Parameters.f90
      CRTM_Tangent_Linear_Module.f90
      CRTM_Utility/CRTM_Utility.f90
      CRTM_Version.inc
      GeometryInfo/CRTM_Geometry_Define.f90
      GeometryInfo/CRTM_GeometryInfo_Define.f90
      GeometryInfo/CRTM_GeometryInfo.f90
      InstrumentInfo/Instruments/Subset_Define.f90
      InstrumentInfo/SensorInfo/SensorInfo_Parameters.f90
      Interpolation/CRTM_Interpolation.f90
      NLTE/NLTE_Correction/CRTM_NLTECorrection.f90
      NLTE/NLTE_Parameters.f90
      NLTE/NLTE_Predictor/NLTE_Predictor_Define.f90
      NLTE/NLTE_Predictor/NLTE_Predictor_IO.f90
      Options/CRTM_Options_Define.f90
      Options/SSU_Input/SSU_Input_Define.f90
      Options/Zeeman_Input/Zeeman_Input_Define.f90
      RTSolution/ADA/ADA_Module.f90
      RTSolution/Common_RTSolution.f90
      RTSolution/CRTM_RTSolution_Define.f90
      RTSolution/CRTM_RTSolution.f90
      RTSolution/CRTM_Active_Sensor.f90
      RTSolution/Emission/Emission_Module.f90
      RTSolution/RTV_Define.f90
      RTSolution/SOI/SOI_Module.f90
      SensorInfo/CRTM_SensorInfo.f90
      SfcOptics/CRTM_IR_Ice_SfcOptics.f90
      SfcOptics/CRTM_IR_Land_SfcOptics.f90
      SfcOptics/CRTM_IR_Snow_SfcOptics.f90
      SfcOptics/CRTM_IR_Water_SfcOptics.f90
      SfcOptics/CRTM_MW_Ice_SfcOptics.f90
      SfcOptics/CRTM_MW_Land_SfcOptics.f90
      SfcOptics/CRTM_MW_Snow_SfcOptics.f90
      SfcOptics/CRTM_MW_Water_SfcOptics.f90
      SfcOptics/CRTM_SfcOptics_Define.f90
      SfcOptics/CRTM_SfcOptics.f90
      SfcOptics/CRTM_VIS_Ice_SfcOptics.f90
      SfcOptics/CRTM_VIS_Land_SfcOptics.f90
      SfcOptics/CRTM_VIS_Snow_SfcOptics.f90
      SfcOptics/CRTM_VIS_Water_SfcOptics.f90
      SfcOptics/IR_Water/IRSSEM/CRTM_IRSSEM.f90
      SfcOptics/IR_Snow/CRTM_IRSnowEM.f90
      SfcOptics/MW_Water/FASTEM_MWSSEM/Azimuth_Emissivity_F6_Module.f90
      SfcOptics/MW_Water/FASTEM_MWSSEM/Azimuth_Emissivity_Module.f90
      SfcOptics/MW_Water/FASTEM_MWSSEM/CRTM_Fastem1.f90
      SfcOptics/MW_Water/FASTEM_MWSSEM/CRTM_FastemX.f90
      SfcOptics/MW_Water/FASTEM_MWSSEM/Foam_Utility_Module.f90
      SfcOptics/MW_Water/FASTEM_MWSSEM/Large_Scale_Correction_Module.f90
      SfcOptics/MW_Water/FASTEM_MWSSEM/Reflection_Correction_Module.f90
      SfcOptics/MW_Water/FASTEM_MWSSEM/Slope_Variance.f90
      SfcOptics/MW_Water/FASTEM_MWSSEM/Small_Scale_Correction_Module.f90
      SfcOptics/MW_Water/Fresnel/Fresnel.f90
      SfcOptics/MW_Water/LowFrequency_MWSSEM/CRTM_LowFrequency_MWSSEM.f90
      SfcOptics/MW_Water/Ocean_Permittivity/Ellison.f90
      SfcOptics/MW_Water/Ocean_Permittivity/Guillou.f90
      SfcOptics/MW_Water/Ocean_Permittivity/Liu.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_AMSRE_SICEEM_Module.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_AMSRE_SNOWEM_Module.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_AMSU_SICEEM_Module.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_AMSU_SnowEM_Module.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_ATMS_SeaICE_LIB.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_ATMS_SeaICE_Module.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_ATMS_SnowEM_Module.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_LandEM_Module.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_MHS_SICEEM_Module.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_MHS_SnowEM_Module.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_SEAICE_PHYEM_MODULE.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_SnowEM_ATMS_Parameters.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_SnowEM_Parameters.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_SSMI_Module.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_SSMI_SIceEM_Module.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_SSMI_SnowEM_Module.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_SSMIS_SeaIceEM_Module.f90
      SfcOptics/NESDIS_Emissivity/NESDIS_SSMIS_SnowEM_Module.f90
      SfcOptics/SEcategory/CRTM_SEcategory.f90
      Source_Functions/CRTM_Planck_Functions.f90
      Surface/CRTM_Surface_Define.f90
      Surface/SensorData/CRTM_SensorData_Define.f90
      Test_Utility/UnitTest/UnitTest_Define.f90
      Utility/Binary_File_Utility.f90
      Utility/Compare_Float_Numbers.f90
      Utility/DateTime_Utility/DateTime_Utility.f90
      Utility/DateTime_Utility/Date_Utility.f90
      Utility/Endian_Utility/Endian_Utility.f90
      Utility/File_Utility.f90
      Utility/Fundamental_Constants.f90
      Utility/Hyperbolic_Step/Hyperbolic_Step.f90
      Utility/Message_Handler.f90
      Utility/netCDF/netCDF_Attribute_Utility.f90
      Utility/netCDF/netCDF_Dimension_Utility.f90
      Utility/netCDF/netCDF_Utility.f90
      Utility/netCDF/netCDF_Variable_Utility.f90
      Utility/Profile_Utility/Profile_Utility_Parameters.f90
      Utility/Search_Utility/Search_Utility.f90
      Utility/Sort_Utility/Sort_Utility.f90
      Utility/Spectral_Utility/Spectral_Units_Conversion.f90
      Utility/String_Utility.f90
      Utility/Timing_Utility.f90
      Utility/Type_Kinds.f90
      Zeeman/Zeeman_Utility.f90
)
include(GNUInstallDirs)

# Option to select between shared and static libraries
option(BUILD_SHARED_LIBS "Build shared libraries instead of static ones" ON)

# Set library type (static or shared)
set(LIBRARY_TYPE STATIC)
if(BUILD_SHARED_LIBS)
  set(LIBRARY_TYPE SHARED)
endif()

# Set module output directory for build and install interfaces
set(MODULE_DIR module/${PROJECT_NAME}/${CMAKE_Fortran_COMPILER_ID}/${CMAKE_Fortran_COMPILER_VERSION})

# Build the library
add_library(${PROJECT_NAME} ${LIBRARY_TYPE} ${crtm_src_files})

# Link dependencies
target_link_libraries(${PROJECT_NAME} PUBLIC OpenMP::OpenMP_Fortran)
target_link_libraries(${PROJECT_NAME} PUBLIC NetCDF::NetCDF_Fortran)

# Set the Fortran module directory for build and install phases
set_target_properties(${PROJECT_NAME} PROPERTIES
    Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/${MODULE_DIR})

# Install Fortran modules into the correct destination
install(DIRECTORY ${CMAKE_BINARY_DIR}/${MODULE_DIR}/ DESTINATION ${CRTM_INSTALL_PREFIX}/${MODULE_DIR})

# Set include directories for build and install separately
target_include_directories(${PROJECT_NAME} INTERFACE
    $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/${MODULE_DIR}>  # During the build
    $<INSTALL_INTERFACE:${MODULE_DIR}>)                  # After install
