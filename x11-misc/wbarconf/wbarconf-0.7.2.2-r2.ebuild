# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit python-single-r1

DESCRIPTION="Configuration GUI for x11-misc/wbar"
HOMEPAGE="http://koti.kapsi.fi/ighea/wbarconf/"
SRC_URI="http://koti.kapsi.fi/ighea/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="sys-devel/gettext"
RDEPEND="
	${PYTHON_DEPS}
	>=x11-misc/wbar-1.3.3
	dev-python/pygobject:2[${PYTHON_USEDEP}]
	dev-python/pygtk:2[${PYTHON_USEDEP}]"

S="${WORKDIR}/${PN}"
PATCHES=( "${FILESDIR}"/${P}-install.patch )

src_install() {
	./install.sh "${ED%/}/usr" || die "./install.sh failed."
	python_doscript wbarconf
}
