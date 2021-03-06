# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

inherit toolchain-funcs

DESCRIPTION="Touchpad config for ALPS and Synaptics TPs. Controls tap/click behaviour"
HOMEPAGE="http://www.compass.com/synaptics/"
SRC_URI="http://www.compass.com/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DOCS=( README AUTHORS NEWS INSTALL )

src_compile() {
	econf
	emake CC="$(tc-getCC)"
}

src_install() {
	dobin "${PN}"
	doinitd "${FILESDIR}"/"${PN}"
	newconfd "${FILESDIR}"/"${PN}.conf" "${PN}"
}
