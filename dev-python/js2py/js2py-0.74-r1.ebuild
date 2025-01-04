# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="Js2Py"
PYTHON_COMPAT=( python3_{12,13,13t} )

inherit distutils-r1 pypi

DESCRIPTION="JavaScript to Python Translator & JavaScript interpreter written in 100% pure Python."
HOMEPAGE="
  https://pypi.org/project/js2py/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"
RESTRICT="test"

GENERATED_DEPEND="
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/tzlocal[${PYTHON_USEDEP}]
	dev-python/pyjsparser[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_DEPEND} 
	>=dev-python/pyjsparser-2.5.1[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}/${PN}-0.74-CVE-2024-28397.patch"
	"${FILESDIR}/${PN}-0.74-py312-load_attr.patch"
)

python_test() {
	pushd ./tests >/dev/null || die

	# run.py requires "node_failed.txt" file
	touch ./node_failed.txt || die

	# https://bugs.gentoo.org/831356
	# make run.py return a non-zero exit code if any test failed
	echo 'sys.exit(len(FAILING))' >> ./run.py || die

	"${EPYTHON}" ./run.py || die "tests failed with ${EPYTHON}"

	popd >/dev/null || die
}
