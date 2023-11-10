###########################################################################
# Copyright 2015, 2016, 2017, 2018, 2019 IoT.bzh
#
# author: Fulup Ar Foll <fulup@iot.bzh>
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

set(CMAKE_INSTALL_SO_NO_EXE 0)

# Project Info
# ------------------
set(PROJECT_PRETTY_NAME "oidc-pcsc plugin for oidc-pcsc readers")
set(PROJECT_DESCRIPTION "Provide pcsc-lite integration with AFB")
set(PROJECT_URL "https://github.com/Tux-EVSE/lib-pcscs-client")
set(PROJECT_ICON "icon.jpg")
set(PROJECT_AUTHOR "Iot-Team")
set(PROJECT_AUTHOR_MAIL "secretariat@iot.bzh")
set(PROJECT_LICENSE "Apache-2")
set(PROJECT_LANGUAGES,"C")
set(PROJECT_VERSION 1.0)

# Where are stored default templates files from submodule or subtree app-templates in your project tree
set(PROJECT_CMAKE_CONF_DIR "conf.d")

# Compilation Mode (DEBUG, RELEASE)
# ----------------------------------
set(BUILD_TYPE "DEBUG")

# Compiler selection if needed. Impose a minimal version.
# -----------------------------------------------
set (gcc_minimal_version 4.9)

# PKG_CONFIG required packages
# -----------------------------
set (PKG_REQUIRED_LIST
	libafb>=5
    librp-utils
    libpcsclite
)

# Print a helper message when every thing is finished
# ----------------------------------------------------
set( CLOSING_MESSAGE "Debug: ./src/pcscd-client --config=../test/simple-scard.json")

# (BUG!!!) as PKG_CONFIG_PATH does not work [should be an env variable]
# ---------------------------------------------------------------------
set(INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX})
set(CMAKE_PREFIX_PATH ${CMAKE_INSTALL_PREFIX}/lib64/pkgconfig ${CMAKE_INSTALL_PREFIX}/lib/pkgconfig)
set(LD_LIBRARY_PATH ${CMAKE_INSTALL_PREFIX}/lib64 ${CMAKE_INSTALL_PREFIX}/lib)

# This include is mandatory and MUST happens at the end
# of this file, else you expose you to unexpected behavior
# -----------------------------------------------------------
include(CMakeAfbTemplates)
