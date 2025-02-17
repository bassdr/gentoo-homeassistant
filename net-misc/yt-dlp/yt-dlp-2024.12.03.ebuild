# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12,13{,t}} )
inherit bash-completion-r1 distutils-r1 optfeature wrapper

DESCRIPTION="A feature-rich command-line audio/video downloader"
HOMEPAGE="
  https://pypi.org/project/yt-dlp/
  Documentation, https://github.com/yt-dlp/yt-dlp#readme
  Repository, https://github.com/yt-dlp/yt-dlp
  Tracker, https://github.com/yt-dlp/yt-dlp/issues
  Funding, https://github.com/yt-dlp/yt-dlp/blob/master/Collaborators.md#collaborators
"
SRC_URI="
	https://github.com/yt-dlp/yt-dlp/releases/download/${PV}/${PN}.tar.gz
		-> ${P}.tar.gz
"
S=${WORKDIR}/${PN}

LICENSE="Unlicense"
SLOT="0"
# note that yt-dlp bumps are typically done straight-to-stable (unless there
# was major/breaking changes) given website changes breaks it on a whim
KEYWORDS="amd64 arm64"

GENERATED_IUSE="build curl-cffi default pyinstaller secretstorage static-analysis"
IUSE="${GENERATED_IUSE} +build +default"
REQUIRES_DIST="
	autopep8~=2.0; extra == 'dev'
	autopep8~=2.0; extra == 'static-analysis'
	brotli; implementation_name == 'cpython' and extra == 'default'
	brotlicffi; implementation_name != 'cpython' and extra == 'default'
	build; extra == 'build'
	certifi; extra == 'default'
	cffi; extra == 'secretstorage'
	curl-cffi!=0.6.*,<0.7.2,>=0.5.10; (os_name != 'nt' and implementation_name == 'cpython') and extra == 'curl-cffi'
	curl-cffi==0.5.10; (os_name == 'nt' and implementation_name == 'cpython') and extra == 'curl-cffi'
	hatchling; extra == 'build'
	mutagen; extra == 'default'
	pip; extra == 'build'
	pre-commit; extra == 'dev'
	pycryptodomex; extra == 'default'
	pyinstaller>=6.11.1; extra == 'pyinstaller'
	pytest-rerunfailures~=14.0; extra == 'dev'
	pytest-rerunfailures~=14.0; extra == 'test'
	pytest~=8.1; extra == 'dev'
	pytest~=8.1; extra == 'test'
	requests<3,>=2.32.2; extra == 'default'
	ruff~=0.8.0; extra == 'dev'
	ruff~=0.8.0; extra == 'static-analysis'
	secretstorage; extra == 'secretstorage'
	setuptools>=71.0.2; extra == 'build'
	urllib3<3,>=1.26.17; extra == 'default'
	websockets>=13.0; extra == 'default'
	wheel; extra == 'build'
"
GENERATED_RDEPEND="${RDEPEND}
	static-analysis? ( >=dev-python/autopep8-2.0[${PYTHON_USEDEP}] =dev-python/autopep8-2*[${PYTHON_USEDEP}] )
	default? ( app-arch/brotli[python,${PYTHON_USEDEP}] )
	build? ( dev-python/build[${PYTHON_USEDEP}] )
	default? ( dev-python/certifi[${PYTHON_USEDEP}] )
	secretstorage? ( dev-python/cffi[${PYTHON_USEDEP}] )
	curl-cffi? ( >=dev-python/curl-cffi-0.5.10[${PYTHON_USEDEP}] <dev-python/curl-cffi-0.7.2[${PYTHON_USEDEP}] !=dev-python/curl-cffi-0.6*[${PYTHON_USEDEP}] )
	build? ( dev-python/hatchling[${PYTHON_USEDEP}] )
	build? ( dev-python/pip[${PYTHON_USEDEP}] )
	default? ( dev-python/pycryptodomex[${PYTHON_USEDEP}] )
	pyinstaller? ( >=dev-python/pyinstaller-6.11.1[${PYTHON_USEDEP}] )
	default? ( >=dev-python/requests-2.32.2[${PYTHON_USEDEP}] <dev-python/requests-3[${PYTHON_USEDEP}] )
	static-analysis? ( >=dev-python/ruff-0.8.0[${PYTHON_USEDEP}] =dev-python/ruff-0.8*[${PYTHON_USEDEP}] )
	secretstorage? ( dev-python/secretstorage[${PYTHON_USEDEP}] )
	build? ( >=dev-python/setuptools-71.0.2[${PYTHON_USEDEP}] )
	default? ( >=dev-python/urllib3-1.26.17[${PYTHON_USEDEP}] <dev-python/urllib3-3[${PYTHON_USEDEP}] )
	default? ( >=dev-python/websockets-13.0[${PYTHON_USEDEP}] )
	build? ( dev-python/wheel[${PYTHON_USEDEP}] )
	default? ( media-libs/mutagen[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_RDEPEND}
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	!net-misc/youtube-dl[-yt-dlp(-)]
"

distutils_enable_tests pytest
GENERATED_BDEPEND="${BDEPEND}
	test? (
		>=dev-python/autopep8-2.0[${PYTHON_USEDEP}] =dev-python/autopep8-2*[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.1[${PYTHON_USEDEP}] =dev-python/pytest-8*[${PYTHON_USEDEP}]
		>=dev-python/pytest-rerunfailures-14.0[${PYTHON_USEDEP}] =dev-python/pytest-rerunfailures-14*[${PYTHON_USEDEP}]
		>=dev-python/ruff-0.8.0[${PYTHON_USEDEP}] =dev-python/ruff-0.8*[${PYTHON_USEDEP}]
		dev-vcs/pre-commit[${PYTHON_USEDEP}]
	)
"
BDEPEND="${GENERATED_BDEPEND}"

python_test() {
	local EPYTEST_DESELECT=(
		# fails with FEATURES=network-sandbox
		test/test_networking.py::TestHTTPRequestHandler::test_connect_timeout
		# fails with FEATURES=distcc, bug #915614
		test/test_networking.py::TestYoutubeDLNetworking::test_proxy\[None-expected2\]
	)

	epytest -m 'not download'
}

python_install_all() {
	dodoc README.md Changelog.md supportedsites.md
	doman yt-dlp.1

	dobashcomp completions/bash/yt-dlp

	insinto /usr/share/fish/vendor_completions.d
	doins completions/fish/yt-dlp.fish

	insinto /usr/share/zsh/site-functions
	doins completions/zsh/_yt-dlp

	rm -r "${ED}"/usr/share/doc/yt_dlp || die

	make_wrapper youtube-dl "yt-dlp --compat-options youtube-dl"
}

pkg_postinst() {
	optfeature "various features (merging tracks, streamed content)" media-video/ffmpeg
	has_version media-video/atomicparsley || # allow fallback but don't advertise
		optfeature "embedding metadata thumbnails in MP4/M4A files" media-libs/mutagen
	optfeature "decrypting cookies from Chromium-based browsers" dev-python/secretstorage

	if [[ ! ${REPLACING_VERSIONS} ]]; then
		elog 'A wrapper using "yt-dlp --compat-options youtube-dl" was installed'
		elog 'as "youtube-dl". This is strictly for compatibility and it is'
		elog 'recommended to use "yt-dlp" directly, it may be removed in the future.'
	fi
}
