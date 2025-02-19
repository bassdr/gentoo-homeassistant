# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
GENERATED_IUSE="basic docs gpl-license pixeldata test"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/pydicom/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

REQUIRES_DIST="
	black==24.8.0; extra == 'dev'
	matplotlib; extra == 'docs'
	mypy==1.11.2; extra == 'dev'
	numpy; extra == 'basic'
	numpy; extra == 'docs'
	numpy; extra == 'pixeldata'
	numpydoc; extra == 'docs'
	pillow; extra == 'docs'
	pillow; extra == 'pixeldata'
	pre-commit; extra == 'dev'
	pydicom-data; extra == 'dev'
	pyjpegls; extra == 'pixeldata'
	pylibjpeg[libjpeg]; extra == 'gpl-license'
	pylibjpeg[openjpeg]; extra == 'pixeldata'
	pylibjpeg[rle]; extra == 'pixeldata'
	pytest-cov; extra == 'dev'
	pytest; extra == 'dev'
	python-gdcm; extra == 'pixeldata'
	ruff==0.6.3; extra == 'dev'
	sphinx-copybutton; extra == 'docs'
	sphinx-gallery; extra == 'docs'
	sphinx; extra == 'docs'
	sphinx_rtd_theme; extra == 'docs'
	sphinxcontrib-jquery; extra == 'docs'
	sphinxcontrib-napoleon; extra == 'docs'
	types-pydicom; extra == 'basic'
	types-requests; extra == 'dev'
"
GENERATED_RDEPEND="${RDEPEND}
	docs? ( dev-python/matplotlib[${PYTHON_USEDEP}] )
	basic? ( dev-python/numpy[${PYTHON_USEDEP}] )
	docs? ( dev-python/numpy[${PYTHON_USEDEP}] )
	pixeldata? ( dev-python/numpy[${PYTHON_USEDEP}] )
	docs? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	docs? ( dev-python/pillow[${PYTHON_USEDEP}] )
	pixeldata? ( dev-python/pillow[${PYTHON_USEDEP}] )
	pixeldata? ( dev-python/pyjpegls[${PYTHON_USEDEP}] )
	gpl-license? ( dev-python/pylibjpeg[libjpeg,${PYTHON_USEDEP}] )
	pixeldata? ( dev-python/pylibjpeg[openjpeg,${PYTHON_USEDEP}] )
	pixeldata? ( dev-python/pylibjpeg[rle,${PYTHON_USEDEP}] )
	pixeldata? ( dev-python/python-gdcm[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-gallery[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-jquery[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-napoleon[${PYTHON_USEDEP}] )
	basic? ( dev-python/types-pydicom[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		~dev-python/black-24.8.0[${PYTHON_USEDEP}]
		~dev-python/mypy-1.11.2[${PYTHON_USEDEP}]
		dev-python/pydicom-data[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		~dev-python/ruff-0.6.3[${PYTHON_USEDEP}]
		dev-python/types-requests[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"
