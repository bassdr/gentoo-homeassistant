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

GENERATED_IUSE="docs"
IUSE="${GENERATED_IUSE}"
GENERATED_RDEPEND="${RDEPEND}
	>=dev-python/anyio-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/argon2-cffi-21.1[${PYTHON_USEDEP}]
	docs? ( dev-python/ipykernel[${PYTHON_USEDEP}] )
	>=dev-python/jinja2-3.0.3[${PYTHON_USEDEP}]
	docs? ( dev-python/jinja2[${PYTHON_USEDEP}] )
	>=dev-python/jupyter-client-7.4.4[${PYTHON_USEDEP}]
	docs? ( dev-python/jupyter-client[${PYTHON_USEDEP}] )
	!=dev-python/jupyter-core-5.0*[${PYTHON_USEDEP}]
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
BDEPEND="
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
GENERATED_BDEPEND="${BDEPEND}
	test? (
		dev-python/flaky[${PYTHON_USEDEP}]
		dev-python/ipykernel[${PYTHON_USEDEP}]
		<dev-python/pytest-9[${PYTHON_USEDEP}]
		dev-python/pytest-console-scripts[${PYTHON_USEDEP}]
		>=dev-python/pytest-jupyter-0.7[server,${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

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
