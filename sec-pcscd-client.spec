Name: sec-pcscd-client
Version: 0.0.2
Release: 2%{?dist}
Summary: Sample implementation for Smartcard/NFC-token authentication based on pcsc-lite

License:  Apache-1.0
URL: http://git.ovh.iot/redpesk/redpesk-common/sec-pcscd-client.git
Source0: %{name}-%{version}.tar.gz

BuildRequires: cmake
BuildRequires: gcc
BuildRequires: pkgconfig(librp-utils)
BuildRequires: pkgconfig(libpcsclite)
BuildRequires: pkgconfig(json-c)
BuildRequires: uthash-devel

%description
sample implementation for Smartcard/NFC-token authentication based on pcsc-lite.

%package devel
Summary:  Sample implementation for Smartcard/NFC-token authentication based on pcsc-lite
Requires: %{name} = %{version}-%{release}

%description devel
sample implementation for Smartcard/NFC-token authentication based on pcsc-lite.


%prep
%autosetup -p 1

%build
%cmake .
%cmake_build

%install
%cmake_install

%files
%{_prefix}/lib64/libpcscd-glue.*
%{_bindir}/pcscd-client

%files devel
%{_prefix}/include/*.h

%changelog
