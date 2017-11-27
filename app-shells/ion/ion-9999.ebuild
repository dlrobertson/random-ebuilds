# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CRATES=""

inherit cargo
inherit git-r3

DESCRIPTION="The Ion Shell. Compatible with Redox and Linux."
HOMEPAGE="https://github.com/redox-os/ion"
EGIT_REPO_URI="https://github.com/redox-os/ion"

LICENSE="|| ( MIT Unlicense )"
SLOT="0"

DEPEND=">=virtual/rust-1.17"

src_test() {
  cargo test || die "tests failed"
}

src_install() {
  cargo_src_install
}
