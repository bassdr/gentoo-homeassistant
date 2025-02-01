# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/tf-models-official/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64"
GENERATED_IUSE=""
IUSE="${GENERATED_IUSE} test"
RESTRICT="!test? ( test )"

DOCS="README.md"

GENERATED_DEPEND="${PYTHON_DEPS}
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/dataclasses[${PYTHON_USEDEP}]
	dev-python/gin-config[${PYTHON_USEDEP}]
	>=dev-python/google-api-python-client-1.6.7[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-bigquery-0.31.0[${PYTHON_USEDEP}]
	>=dev-python/kaggle-1.3.9[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.15.4[${PYTHON_USEDEP}]
	dev-python/oauth2client[${PYTHON_USEDEP}]
	dev-python/opencv-python-headless[${PYTHON_USEDEP}]
	>=dev-python/pandas-0.22.0[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.4.3[${PYTHON_USEDEP}]
	>=dev-python/py-cpuinfo-3.3.0[${PYTHON_USEDEP}]
	dev-python/pycocotools[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	dev-python/sacrebleu[${PYTHON_USEDEP}]
	>=dev-python/scipy-0.19.1[${PYTHON_USEDEP}]
	dev-python/sentencepiece[${PYTHON_USEDEP}]
	dev-python/seqeval[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/tensorflow-2.5.0[${PYTHON_USEDEP}]
	dev-python/tensorflow-addons[${PYTHON_USEDEP}]
	dev-python/tensorflow-datasets[${PYTHON_USEDEP}]
	>=dev-python/tensorflow-hub-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/tensorflow-model-optimization-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/tf-slim-1.1.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
# RDEPEND could not be inserted in this ebuild
