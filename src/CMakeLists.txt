###########################################################################
# Copyright 2015-2024 IoT.bzh
#
# author: Fulup Ar Foll <fulup@iot.bzh>
# author: Louis-Baptiste Sobolewski <lb.sobolewski@iot.bzh>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###########################################################################

pkg_check_modules(deps REQUIRED
    json-c
    librp-utils
    libpcsclite
)
check_include_file(uthash.h check_uthash)

# Build pcscd-glue
add_library(pcscd-glue SHARED pcsc-config.c pcsc-glue.c)
target_include_directories(pcscd-glue PUBLIC ${deps_INCLUDE_DIRS})
target_link_libraries(pcscd-glue PUBLIC ${deps_LIBRARIES} pthread)
# Install pcscd-glue
install(TARGETS pcscd-glue DESTINATION ${CMAKE_INSTALL_LIBDIR})
install(FILES pcsc-config.h pcsc-glue.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}) 

# Build pcscd-client
add_executable(pcscd-client client-pcsc.c)
add_dependencies(pcscd-client pcscd-glue)
target_link_libraries(pcscd-client PUBLIC ${deps_LIBRARIES} pthread pcscd-glue)
# Install pcscd-client
install(TARGETS pcscd-client DESTINATION ${CMAKE_INSTALL_BINDIR})
