# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="allure flake8 ipdb mss pdfminer proxy psutil pyautogui selenium-stealth selenium-wire"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/seleniumbase/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	allure? ( >=dev-python/allure-behave-2.13.5[${PYTHON_USEDEP}] )
	allure? ( >=dev-python/allure-pytest-2.13.5[${PYTHON_USEDEP}] )
	allure? ( >=dev-python/allure-python-commons-2.13.5[${PYTHON_USEDEP}] )
	>=dev-python/attrs-25.1.0[${PYTHON_USEDEP}]
	~dev-python/beautifulsoup4-4.12.3[${PYTHON_USEDEP}]
	~dev-python/behave-1.2.6[${PYTHON_USEDEP}]
	selenium-wire? ( ~dev-python/blinker-1.7.0[${PYTHON_USEDEP}] )
	selenium-wire? ( ~dev-python/brotli-1.1.0[${PYTHON_USEDEP}] )
	>=dev-python/certifi-3024.7.22[${PYTHON_USEDEP}]
	pdfminer? ( ~dev-python/cffi-1.17.1[${PYTHON_USEDEP}] )
	~dev-python/chardet-5.2.0[${PYTHON_USEDEP}]
	~dev-python/charset-normalizer-3.4.1[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
	>=dev-python/coverage-7.6.1[${PYTHON_USEDEP}]
	~dev-python/cryptography-39.0.2[${PYTHON_USEDEP}]
	~dev-python/cssselect-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/exceptiongroup-1.2.2[${PYTHON_USEDEP}]
	~dev-python/execnet-2.1.1[${PYTHON_USEDEP}]
	>=dev-python/fasteners-0.19[${PYTHON_USEDEP}]
	~dev-python/filelock-3.16.1[${PYTHON_USEDEP}]
	~dev-python/flake8-5.0.4[${PYTHON_USEDEP}]
	~dev-python/h11-0.14.0[${PYTHON_USEDEP}]
	selenium-wire? ( ~dev-python/h2-4.1.0[${PYTHON_USEDEP}] )
	selenium-wire? ( ~dev-python/hpack-4.0.0[${PYTHON_USEDEP}] )
	selenium-wire? ( ~dev-python/hyperframe-6.0.1[${PYTHON_USEDEP}] )
	~dev-python/idna-3.10[${PYTHON_USEDEP}]
	~dev-python/iniconfig-2.0.0[${PYTHON_USEDEP}]
	ipdb? ( ~dev-python/ipdb-0.13.13[${PYTHON_USEDEP}] )
	ipdb? ( ~dev-python/ipython-7.34.0[${PYTHON_USEDEP}] )
	>=dev-python/jinja2-3.1.5[${PYTHON_USEDEP}]
	selenium-wire? ( ~dev-python/kaitaistruct-0.10[${PYTHON_USEDEP}] )
	~dev-python/markdown-it-py-3.0.0[${PYTHON_USEDEP}]
	~dev-python/markupsafe-2.1.5[${PYTHON_USEDEP}]
	flake8? ( ~dev-python/mccabe-0.7.0[${PYTHON_USEDEP}] )
	~dev-python/mdurl-0.1.2[${PYTHON_USEDEP}]
	mss? ( ~dev-python/mss-9.0.2[${PYTHON_USEDEP}] )
	>=dev-python/mycdp-1.1.0[${PYTHON_USEDEP}]
	~dev-python/outcome-1.3.0_p0[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
	~dev-python/parameterized-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/parse-1.20.2[${PYTHON_USEDEP}]
	>=dev-python/parse-type-0.6.4[${PYTHON_USEDEP}]
	>=dev-python/pdbp-1.6.1[${PYTHON_USEDEP}]
	pdfminer? ( ~dev-python/pdfminer-six-20240706[${PYTHON_USEDEP}] )
	>=dev-python/pillow-10.4.0[${PYTHON_USEDEP}]
	>=dev-python/pip-24.3.1[${PYTHON_USEDEP}]
	~dev-python/pip-system-certs-4.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.3.6[${PYTHON_USEDEP}]
	~dev-python/pluggy-1.5.0[${PYTHON_USEDEP}]
	proxy? ( ~dev-python/proxy-py-2.4.3[${PYTHON_USEDEP}] )
	psutil? ( ~dev-python/psutil-6.0.0[${PYTHON_USEDEP}] )
	selenium-wire? ( ~dev-python/pyasn1-0.6.1[${PYTHON_USEDEP}] )
	pyautogui? ( ~dev-python/pyautogui-0.9.54[${PYTHON_USEDEP}] )
	~dev-python/pycodestyle-2.9.1[${PYTHON_USEDEP}]
	pdfminer? ( ~dev-python/pycparser-2.22[${PYTHON_USEDEP}] )
	~dev-python/pyflakes-2.5.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.19.1[${PYTHON_USEDEP}]
	>=dev-python/pynose-1.5.3[${PYTHON_USEDEP}]
	selenium-wire? ( ~dev-python/pyopenssl-24.2.1[${PYTHON_USEDEP}] )
	~dev-python/pyotp-2.9.0[${PYTHON_USEDEP}]
	selenium-wire? ( >=dev-python/pyparsing-3.1.4[${PYTHON_USEDEP}] )
	>=dev-python/pyreadline3-3.5.3[${PYTHON_USEDEP}]
	~dev-python/pytest-8.3.4[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
	~dev-python/pytest-html-4.0.2[${PYTHON_USEDEP}]
	~dev-python/pytest-metadata-3.1.1[${PYTHON_USEDEP}]
	~dev-python/pytest-ordering-0.6[${PYTHON_USEDEP}]
	~dev-python/pytest-rerunfailures-14.0[${PYTHON_USEDEP}]
	~dev-python/pytest-xdist-3.6.1[${PYTHON_USEDEP}]
	~dev-python/python-xlib-0.33[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	~dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	~dev-python/rich-13.9.4[${PYTHON_USEDEP}]
	>=dev-python/sbvirtualdisplay-1.4.0[${PYTHON_USEDEP}]
	~dev-python/selenium-4.27.1[${PYTHON_USEDEP}]
	selenium-stealth? ( ~dev-python/selenium-stealth-1.0.6[${PYTHON_USEDEP}] )
	selenium-wire? ( ~dev-python/selenium-wire-5.1.0[${PYTHON_USEDEP}] )
	>=dev-python/setuptools-75.8.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.17.0[${PYTHON_USEDEP}]
	~dev-python/sniffio-1.3.1[${PYTHON_USEDEP}]
	~dev-python/sortedcontainers-2.4.0[${PYTHON_USEDEP}]
	~dev-python/soupsieve-2.6[${PYTHON_USEDEP}]
	>=dev-python/tabcompleter-1.4.0[${PYTHON_USEDEP}]
	~dev-python/trio-0.27.0[${PYTHON_USEDEP}]
	~dev-python/trio-websocket-0.11.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	<dev-python/urllib3-2.4.0[${PYTHON_USEDEP}]
	~dev-python/websocket-client-1.8.0[${PYTHON_USEDEP}]
	~dev-python/websockets-13.1[${PYTHON_USEDEP}]
	>=dev-python/wheel-0.45.1[${PYTHON_USEDEP}]
	~dev-python/wsproto-1.2.0[${PYTHON_USEDEP}]
	selenium-wire? ( ~dev-python/zstandard-0.23.0[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest