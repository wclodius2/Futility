!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++!
!                              Copyright (C) 2012                              !
!                   The Regents of the University of Michigan                  !
!              MPACT Development Group and Prof. Thomas J. Downar              !
!                             All rights reserved.                             !
!                                                                              !
! Copyright is reserved to the University of Michigan for purposes of          !
! controlled dissemination, commercialization through formal licensing, or     !
! other disposition. The University of Michigan nor any of their employees,    !
! makes any warranty, express or implied, or assumes any liability or          !
! responsibility for the accuracy, completeness, or usefulness of any          !
! information, apparatus, product, or process disclosed, or represents that    !
! its use would not infringe privately owned rights. Reference herein to any   !
! specific commercial products, process, or service by trade name, trademark,  !
! manufacturer, or otherwise, does not necessarily constitute or imply its     !
! endorsement, recommendation, or favoring by the University of Michigan.      !
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++!
PROGRAM testXMLProc
#include "UnitTest.h"
  USE UnitTest
  USE ISO_FORTRAN_ENV
  USE IntrType
  USE ExceptionHandler
  USE IOutil
  USE XMLProc

  IMPLICIT NONE
#ifdef HAVE_MPI
  INCLUDE 'mpif.h'
  INTEGER :: mpierr
  CALL MPI_Init(mpierr)
#else
  INTEGER :: MPI_COMM_WORLD=0
#endif
  
  !WRITE(*,*) '==================================================='
  !WRITE(*,*) 'TESTING XMLPROC...'
  !WRITE(*,*) '==================================================='
  CREATE_TEST("XMLProc")
  utest_interactive=.TRUE.
  
  !CALL ScanXML()
  REGISTER_SUBTEST("A",mysubroutine)
  ASSERT(.TRUE.,"test 1")
  ASSERTFAIL(.TRUE.,"test 2")
  ASSERT(.FALSE.,"test 3")
  REGISTER_SUBTEST("B",mysubroutine)
  ASSERT(.TRUE.,"test 1")
  ASSERTFAIL(.TRUE.,"test 2")
  ASSERT(.FALSE.,"test 3")
  REGISTER_SUBTEST("C",mysubroutine)
  ASSERT(.TRUE.,"test 1")
  ASSERTFAIL(.TRUE.,"test 2")
  ASSERT(.FALSE.,"test 3")
  !ASSERTFAIL(.FALSE.,"test 4")
  
  FINALIZE_TEST()
  !WRITE(*,*) '==================================================='
  !WRITE(*,*) 'TESTING XMLPROC PASSED!'
  !WRITE(*,*) '==================================================='
  STAY()
#ifdef HAVE_MPI
  CALL MPI_Finalize(mpierr)
#endif
!  READ(*,*)
!
!===============================================================================
!  CONTAINS
!
ENDPROGRAM testXMLProc

