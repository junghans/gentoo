# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{4,5} pypy )

inherit distutils-r1

DESCRIPTION="Python cross-version byte-code deparser"
HOMEPAGE="https://github.com/rocky/python-uncompyle6/ https://pypi.python.org/pypi/uncompyle6"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	>=dev-python/xdis-3.2.3
	<dev-python/xdis-3.3.0
	>=dev-python/spark-parser-1.5.1
	<dev-python/spark-parser-1.6.0"
DEPEND="${RDEPEND}
	test? (
		>=dev-python/nose-1.0[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

python_prepare_all() {
	distutils-r1_python_prepare_all
}

# only run the recommended "make check" tests
python_test() {
	distutils_install_for_testing

	PYTHONPATH="${S}/test:${BUILD_DIR}/lib" \
		emake check || die "Tests failed under ${EPYTHON}"
}
