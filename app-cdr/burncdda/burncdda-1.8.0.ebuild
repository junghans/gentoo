# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Console app for copying burning audio cds"
HOMEPAGE="http://www.thenktor.homepage.t-online.de/burncdda"
SRC_URI="http://www.thenktor.homepage.t-online.de/burncdda/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ppc ~sparc x86"
IUSE="flac mp3 vorbis"

RDEPEND="
	app-cdr/cdrdao
	dev-util/dialog
	media-sound/normalize
	media-sound/sox
	virtual/cdrtools
	flac? ( media-libs/flac )
	mp3? (
		media-sound/mpg123
		media-sound/mp3_check
	)
	vorbis? ( media-sound/vorbis-tools )
"

src_install() {
	dobin ${PN}

	insinto /usr/lib/${PN}
	doins *.func

	insinto /etc
	doins ${PN}.conf

	dodoc CHANGELOG
	doman burncdda.1.gz
}
