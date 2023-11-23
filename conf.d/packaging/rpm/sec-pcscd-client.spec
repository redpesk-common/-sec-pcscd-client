%global debug_package %{nil}

Name: pcscs-client
Version: 0.0.2
Release: 2%{?dist}
Summary: sample implementation for Smartcard/NFC-token authentication based on pcsc-lite.

License: Apache
URL: http://git.ovh.iot/redpesk/redpesk-common/sec-pcscd-client.git
Source0: %{name}-%{version}.tar.gz

BuildRequires: cmake
BuildRequires: automake
BuildRequires: gcc
BuildRequires: libtool
BuildRequires: afb-cmake-modules
BuildRequires: pkgconfig(afb-binding)
BuildRequires: pkgconfig(libafb)
BuildRequires: afm-rpm-macros
BuildRequires: pkgconfig(afb-libhelpers)
BuildRequires: pkgconfig(libpcsclite)
BuildRequires:  uthash-devel

%description
sample implementation for Smartcard/NFC-token authentication based on pcsc-lite.

%package devel
Summary:        sample implementation for Smartcard/NFC-token authentication based on pcsc-lite
Requires:       %{name} = %{version}-%{release}

%description devel
sample implementation for Smartcard/NFC-token authentication based on pcsc-lite.


%prep
%autosetup -p 1

%build
mkdir -p build
cd build
%cmake ../
%cmake_build

%install
cd build
%cmake_install

%files
%dir %{_prefix}/redpesk/%{name}
%{_prefix}/redpesk/%{name}/bin/pcscd-client
%{_prefix}/redpesk/%{name}/*
%{_prefix}/lib/libpcscd-glue.*

%files devel
%{_prefix}/include/*.h

%changelog
