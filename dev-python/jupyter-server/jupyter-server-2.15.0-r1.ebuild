# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/jupyter-server/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_IUSE="docs test"
IUSE="${GENERATED_IUSE}"
REQUIRES_DIST="
	anyio>=3.1.0
	argon2-cffi>=21.1
	flaky; extra == 'test'
	ipykernel; extra == 'docs'
	ipykernel; extra == 'test'
	jinja2; extra == 'docs'
	jinja2>=3.0.3
	jupyter-client; extra == 'docs'
	jupyter-client>=7.4.4
	jupyter-core!=5.0.*,>=4.12
	jupyter-events>=0.11.0
	jupyter-server-terminals>=0.4.4
	myst-parser; extra == 'docs'
	nbconvert>=6.4.4
	nbformat; extra == 'docs'
	nbformat>=5.3.0
	overrides>=5.0
	packaging>=22.0
	pre-commit; extra == 'test'
	prometheus-client; extra == 'docs'
	prometheus-client>=0.9
	pydata-sphinx-theme; extra == 'docs'
	pytest-console-scripts; extra == 'test'
	pytest-jupyter[server]>=0.7; extra == 'test'
	pytest-timeout; extra == 'test'
	pytest<9,>=7.0; extra == 'test'
	pywinpty>=2.0.1; os_name == 'nt'
	pyzmq>=24
	requests; extra == 'test'
	send2trash; extra == 'docs'
	send2trash>=1.8.2
	sphinx-autodoc-typehints; extra == 'docs'
	sphinxcontrib-github-alt; extra == 'docs'
	sphinxcontrib-openapi>=0.8.0; extra == 'docs'
	sphinxcontrib-spelling; extra == 'docs'
	sphinxemoji; extra == 'docs'
	terminado>=0.8.3
	tornado; extra == 'docs'
	tornado>=6.2.0
	traitlets>=5.6.0
	typing-extensions; extra == 'docs'
	websocket-client>=1.7
"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/anyio-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/argon2-cffi-21.1[${PYTHON_USEDEP}]
	docs? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	>=dev-python/jinja2-3.0.3[${PYTHON_USEDEP}]
	docs? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	>=dev-python/jupyter-client-7.4.4[${PYTHON_USEDEP}]
	docs? ( dev-python/jupyter-client[${PYTHON_USEDEP}] )
	>=dev-python/jupyter-core-4.12[${PYTHON_USEDEP}] !=dev-python/jupyter-core-5.0*[${PYTHON_USEDEP}]
	>=dev-python/jupyter-events-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter-server-terminals-0.4.4[${PYTHON_USEDEP}]
	docs? ( dev-python/myst-parser[${PYTHON_USEDEP}] )
	>=dev-python/nbconvert-6.4.4[${PYTHON_USEDEP}]
	>=dev-python/nbformat-5.3.0[${PYTHON_USEDEP}]
	docs? ( dev-python/nbformat[${PYTHON_USEDEP}] )
	>=dev-python/overrides-5.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-22.0[${PYTHON_USEDEP}]
	>=dev-python/prometheus-client-0.9[${PYTHON_USEDEP}]
	docs? ( dev-python/prometheus-client[${PYTHON_USEDEP}] )
	docs? ( dev-python/pydata-sphinx-theme[${PYTHON_USEDEP}] )
	>=dev-python/pyzmq-24[${PYTHON_USEDEP}]
	>=dev-python/send2trash-1.8.2[${PYTHON_USEDEP}]
	docs? ( dev-python/send2trash[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autodoc-typehints[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-github-alt[${PYTHON_USEDEP}] )
	docs? ( >=dev-python/sphinxcontrib-openapi-0.8.0[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxcontrib-spelling[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinxemoji[${PYTHON_USEDEP}] )
	>=dev-python/terminado-0.8.3[${PYTHON_USEDEP}]
	>=dev-python/tornado-6.2.0[${PYTHON_USEDEP}]
	docs? ( dev-python/tornado[${PYTHON_USEDEP}] )
	>=dev-python/traitlets-5.6.0[${PYTHON_USEDEP}]
	docs? ( dev-python/typing-extensions[${PYTHON_USEDEP}] )
	>=dev-python/websocket-client-1.7[${PYTHON_USEDEP}]
"
RDEPEND="${GENERATED_RDEPEND}
	>=dev-python/anyio-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/argon2-cffi-21.1[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0.3[${PYTHON_USEDEP}]
	>=dev-python/jupyter-client-7.4.4[${PYTHON_USEDEP}]
	>=dev-python/jupyter-core-5.1.0[${PYTHON_USEDEP}]
	>=dev-python/jupyter-server-terminals-0.4.4[${PYTHON_USEDEP}]
	>=dev-python/jupyter-events-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/nbconvert-6.4.4[${PYTHON_USEDEP}]
	>=dev-python/nbformat-5.3.0[${PYTHON_USEDEP}]
	>=dev-python/overrides-5.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-22.0[${PYTHON_USEDEP}]
	>=dev-python/prometheus-client-0.9[${PYTHON_USEDEP}]
	>=dev-python/pyzmq-24[${PYTHON_USEDEP}]
	>=dev-python/send2trash-1.8.2[${PYTHON_USEDEP}]
	>=dev-python/terminado-0.8.3[${PYTHON_USEDEP}]
	>=dev-python/tornado-6.2[${PYTHON_USEDEP}]
	>=dev-python/traitlets-5.6.0[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-1.7[${PYTHON_USEDEP}]
"
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flaky[${PYTHON_USEDEP}]
		dev-python/ipykernel[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.0[${PYTHON_USEDEP}] <dev-python/pytest-9[${PYTHON_USEDEP}]
		dev-python/pytest-console-scripts[${PYTHON_USEDEP}]
		>=dev-python/pytest-jupyter-0.7[server,${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}
	dev-python/hatch-jupyter-builder[${PYTHON_USEDEP}]
	test? (
		dev-python/ipykernel[${PYTHON_USEDEP}]
		dev-python/flaky[${PYTHON_USEDEP}]
		dev-python/pytest-console-scripts[${PYTHON_USEDEP}]
		>=dev-python/pytest-jupyter-0.7[${PYTHON_USEDEP}]
		dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-tornasync[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# This fails if your terminal is zsh (and maybe other non-bash as well?)
		tests/test_terminal.py
		# Fails because above is ignored
		tests/auth/test_authorizer.py
		# Fails with additional extensions installed
		tests/extension/test_app.py::test_stop_extension
	)

	# FIXME: tests seem to be affected by previously installed version
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest \
		-p pytest_tornasync.plugin \
		-p jupyter_server.pytest_plugin \
		-p pytest_console_scripts \
		-p pytest_timeout \
		-p pytest_rerunfailures --reruns=5 \
		-o tmp_path_retention_policy=all
}
