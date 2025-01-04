EAPI=8

PYTHON_COMPAT=( python3_{12,13{,t}} )

inherit python-r1

DESCRIPTION="Home Assistant Meta-Package homeassistant.components.google_cloud"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="amd64 arm64"

RDEPEND="
	~dev-python/google-cloud-speech-2.27.0[${PYTHON_USEDEP}]
	~dev-python/google-cloud-texttospeech-2.17.2[${PYTHON_USEDEP}]
"
