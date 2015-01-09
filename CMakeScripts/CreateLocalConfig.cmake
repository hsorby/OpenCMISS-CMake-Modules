# Make sure a localconfig file exists
if (NOT EXISTS ${OPENCMISS_CONFIG_DIR}/OpenCMISSLocalConfig.cmake)
    include(Variables)
    SET(OCM_LOCAL_FLAGS )
    SET(OCM_USE_FLAGS )
    if (WIN32)
        SET(_NL "\r\n")
    else()
        SET(_NL "\n")
    endif()
    foreach(OCM_COMP ${OPENCMISS_COMPONENTS})
        SET(OCM_LOCAL_FLAGS "${OCM_LOCAL_FLAGS}#SET(OCM_${OCM_COMP}_LOCAL YES)${_NL}")
        SET(OCM_USE_FLAGS "${OCM_USE_FLAGS}#SET(OCM_USE_${OCM_COMP} NO)${_NL}") 
    endforeach()
    configure_file(${OPENCMISS_SETUP_DIR}/Config/OpenCMISSLocalConfig.template.cmake
        ${OPENCMISS_CONFIG_DIR}/OpenCMISSLocalConfig.cmake)
    unset(_NL)
    unset(OCM_LOCAL_FLAGS)
    unset(OCM_USE_FLAGS)
endif()