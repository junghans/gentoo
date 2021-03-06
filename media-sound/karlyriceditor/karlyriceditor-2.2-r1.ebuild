# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils qmake-utils

DESCRIPTION="Application to edit and synchronize lyrics with karaoke songs in various formats"
HOMEPAGE="http://www.ulduzsoft.com/linux/karaoke-lyrics-editor/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libav"

RDEPEND="
	dev-libs/openssl:0=
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5
	dev-qt/qtwidgets:5
	libav? ( media-video/libav:= )
	!libav? ( media-video/ffmpeg:0= )
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

src_configure() {
	eqmake5 "${PN}.pro"
}

src_install() {
	dodoc Changelog
	dobin bin/${PN}
	doicon packages/${PN}.png
	make_desktop_entry ${PN} 'Karaoke Lyrics Editor'
}
