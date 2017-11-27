# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CRATES="
ansi_term-0.9.0
app_dirs-1.1.1
bitflags-0.7.0
bitflags-0.9.1
bytecount-0.1.6
byteorder-1.1.0
bytes-0.4.4
calculate-0.1.0
cfg-if-0.1.2
fnv-1.0.5
futures-0.1.14
glob-0.2.11
iovec-0.1.0
kernel32-sys-0.2.2
lazy_static-0.2.8
lazycell-0.4.0
libc-0.2.26
liner-0.4.0
log-0.3.8
mio-0.6.9
mio-uds-0.6.4
miow-0.2.1
net2-0.2.29
nix-0.8.1
ole32-sys-0.2.0
peg-0.5.4
permutate-0.3.2
quote-0.3.15
redox_syscall-0.1.26
scoped-tls-0.1.0
shell32-sys-0.1.1
slab-0.3.0
smallstring-0.1.2
smallvec-0.3.3
smallvec-0.4.1
termion-1.4.0
tokio-core-0.1.8
tokio-io-0.1.2
tokio-signal-0.1.2
unicode-segmentation-1.2.0
unicode-width-0.1.4
users-0.5.2
version_check-0.1.3
void-1.0.2
winapi-0.2.8
winapi-build-0.1.1
ws2_32-sys-0.2.1
xdg-2.1.0
"

inherit cargo

DESCRIPTION="The Ion Shell. Compatible with Redox and Linux."
HOMEPAGE="https://github.com/redox-os/ion"
SRC_URI="https://github.com/redox-os/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
  $(cargo_crate_uris ${CRATES})"

LICENSE="|| ( MIT Unlicense )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/rust-1.17"

src_test() {
  cargo test || die "tests failed"
}

src_install() {
  cargo_src_install
}
