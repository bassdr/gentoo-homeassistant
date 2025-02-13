# This ebuild was auto-generated by homeassistant script, and the script was not able to find a better candidate.
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12,13{,t}} )
PYPI_NO_NORMALIZE=1
GENERATED_IUSE="dev doc full full-no-qt full-pyqt6 full-pyside6 hdf5 test test-extra"
IUSE="${GENERATED_IUSE}"

inherit distutils-r1 pypi

DESCRIPTION=""
HOMEPAGE="
  https://pypi.org/project/mne/"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm64"

GENERATED_DEPEND="
	full-no-qt? ( >=dev-python/antio-0.5.0[${PYTHON_USEDEP}] )
	full-pyqt6? ( >=dev-python/antio-0.5.0[${PYTHON_USEDEP}] )
	full-pyside6? ( >=dev-python/antio-0.5.0[${PYTHON_USEDEP}] )
	full? ( >=dev-python/antio-0.5.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/codespell[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/codespell[${PYTHON_USEDEP}] )
	test? ( dev-python/codespell[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/darkdetect[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/darkdetect[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/darkdetect[${PYTHON_USEDEP}] )
	full? ( dev-python/darkdetect[${PYTHON_USEDEP}] )
	dev-python/decorator[${PYTHON_USEDEP}]
	full-no-qt? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	full? ( dev-python/defusedxml[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/dipy[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/dipy[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/dipy[${PYTHON_USEDEP}] )
	full? ( dev-python/dipy[${PYTHON_USEDEP}] )
	full-no-qt? ( >=dev-python/edfio-0.2.1[${PYTHON_USEDEP}] )
	full-pyqt6? ( >=dev-python/edfio-0.2.1[${PYTHON_USEDEP}] )
	full-pyside6? ( >=dev-python/edfio-0.2.1[${PYTHON_USEDEP}] )
	full? ( >=dev-python/edfio-0.2.1[${PYTHON_USEDEP}] )
	test-extra? ( >=dev-python/edfio-0.2.1[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/eeglabio[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/eeglabio[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/eeglabio[${PYTHON_USEDEP}] )
	full? ( dev-python/eeglabio[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/eeglabio[${PYTHON_USEDEP}] )
	dev? ( dev-python/graphviz[${PYTHON_USEDEP}] )
	doc? ( dev-python/graphviz[${PYTHON_USEDEP}] )
	full-no-qt? ( >=dev-python/h5io-0.2.4[${PYTHON_USEDEP}] )
	full-pyqt6? ( >=dev-python/h5io-0.2.4[${PYTHON_USEDEP}] )
	full-pyside6? ( >=dev-python/h5io-0.2.4[${PYTHON_USEDEP}] )
	full? ( >=dev-python/h5io-0.2.4[${PYTHON_USEDEP}] )
	hdf5? ( >=dev-python/h5io-0.2.4[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/h5py[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/h5py[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/h5py[${PYTHON_USEDEP}] )
	full? ( dev-python/h5py[${PYTHON_USEDEP}] )
	full-no-qt? ( >=dev-python/imageio-2.6.1[${PYTHON_USEDEP}] )
	full-pyqt6? ( >=dev-python/imageio-2.6.1[${PYTHON_USEDEP}] )
	full-pyside6? ( >=dev-python/imageio-2.6.1[${PYTHON_USEDEP}] )
	full? ( >=dev-python/imageio-2.6.1[${PYTHON_USEDEP}] )
	test-extra? ( >=dev-python/imageio-2.6.1[${PYTHON_USEDEP}] )
	full-no-qt? ( >=dev-python/imageio-ffmpeg-0.4.1[${PYTHON_USEDEP}] )
	full-pyqt6? ( >=dev-python/imageio-ffmpeg-0.4.1[${PYTHON_USEDEP}] )
	full-pyside6? ( >=dev-python/imageio-ffmpeg-0.4.1[${PYTHON_USEDEP}] )
	full? ( >=dev-python/imageio-ffmpeg-0.4.1[${PYTHON_USEDEP}] )
	test-extra? ( >=dev-python/imageio-ffmpeg-0.4.1[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/intersphinx-registry-0.2405.27[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/intersphinx-registry-0.2405.27[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/ipyevents[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/ipyevents[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/ipyevents[${PYTHON_USEDEP}] )
	full? ( dev-python/ipyevents[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/ipympl[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/ipympl[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/ipympl[${PYTHON_USEDEP}] )
	full? ( dev-python/ipympl[${PYTHON_USEDEP}] )
	dev? ( !=dev-python/ipython-8.7.0[${PYTHON_USEDEP}] )
	doc? ( !=dev-python/ipython-8.7.0[${PYTHON_USEDEP}] )
	full-no-qt? ( !=dev-python/ipython-8.7.0[${PYTHON_USEDEP}] )
	full-pyqt6? ( !=dev-python/ipython-8.7.0[${PYTHON_USEDEP}] )
	full-pyside6? ( !=dev-python/ipython-8.7.0[${PYTHON_USEDEP}] )
	full? ( !=dev-python/ipython-8.7.0[${PYTHON_USEDEP}] )
	test-extra? ( !=dev-python/ipython-8.7.0[${PYTHON_USEDEP}] )
	test? ( !=dev-python/ipython-8.7.0[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	full? ( dev-python/ipywidgets[${PYTHON_USEDEP}] )
	dev-python/jinja2[${PYTHON_USEDEP}]
	full-no-qt? ( dev-python/joblib[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/joblib[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/joblib[${PYTHON_USEDEP}] )
	full? ( dev-python/joblib[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/jupyter[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/jupyter[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/jupyter[${PYTHON_USEDEP}] )
	full? ( dev-python/jupyter[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/jupyter-client[${PYTHON_USEDEP}] )
	>=dev-python/lazy-loader-0.3[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.6[${PYTHON_USEDEP}]
	dev? ( dev-python/memory-profiler[${PYTHON_USEDEP}] )
	doc? ( dev-python/memory-profiler[${PYTHON_USEDEP}] )
	full-no-qt? ( >=dev-python/mffpy-0.5.7[${PYTHON_USEDEP}] )
	full-pyqt6? ( >=dev-python/mffpy-0.5.7[${PYTHON_USEDEP}] )
	full-pyside6? ( >=dev-python/mffpy-0.5.7[${PYTHON_USEDEP}] )
	full? ( >=dev-python/mffpy-0.5.7[${PYTHON_USEDEP}] )
	dev? ( dev-python/mne-bids[${PYTHON_USEDEP}] )
	doc? ( dev-python/mne-bids[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/mne-bids[${PYTHON_USEDEP}] )
	dev? ( dev-python/mne-connectivity[${PYTHON_USEDEP}] )
	doc? ( dev-python/mne-connectivity[${PYTHON_USEDEP}] )
	dev? ( dev-python/mne-gui-addons[${PYTHON_USEDEP}] )
	doc? ( dev-python/mne-gui-addons[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/mne-qt-browser[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/mne-qt-browser[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/mne-qt-browser[${PYTHON_USEDEP}] )
	full? ( dev-python/mne-qt-browser[${PYTHON_USEDEP}] )
	dev? ( dev-python/mypy[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/mypy[${PYTHON_USEDEP}] )
	test? ( dev-python/mypy[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/nbclient[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/nbformat[${PYTHON_USEDEP}] )
	dev? ( dev-python/neo[${PYTHON_USEDEP}] )
	doc? ( dev-python/neo[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/neo[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/neo[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/neo[${PYTHON_USEDEP}] )
	full? ( dev-python/neo[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/neo[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/nibabel[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/nibabel[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/nibabel[${PYTHON_USEDEP}] )
	full? ( dev-python/nibabel[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/nilearn[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/nilearn[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/nilearn[${PYTHON_USEDEP}] )
	full? ( dev-python/nilearn[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/nitime[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/numba[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/numba[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/numba[${PYTHON_USEDEP}] )
	full? ( dev-python/numba[${PYTHON_USEDEP}] )
	<dev-python/numpy-3[${PYTHON_USEDEP}]
	dev? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	doc? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	test? ( dev-python/numpydoc[${PYTHON_USEDEP}] )
	full-no-qt? ( >=dev-python/openmeeg-2.5.5[${PYTHON_USEDEP}] )
	full-pyqt6? ( >=dev-python/openmeeg-2.5.5[${PYTHON_USEDEP}] )
	full-pyside6? ( >=dev-python/openmeeg-2.5.5[${PYTHON_USEDEP}] )
	full? ( >=dev-python/openmeeg-2.5.5[${PYTHON_USEDEP}] )
	dev-python/packaging[${PYTHON_USEDEP}]
	full-no-qt? ( dev-python/pandas[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/pandas[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/pandas[${PYTHON_USEDEP}] )
	full? ( dev-python/pandas[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/pillow[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/pillow[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/pillow[${PYTHON_USEDEP}] )
	full? ( dev-python/pillow[${PYTHON_USEDEP}] )
	>=dev-python/pooch-1.5[${PYTHON_USEDEP}]
	dev? ( dev-python/psutil[${PYTHON_USEDEP}] )
	doc? ( dev-python/psutil[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
	full? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/pybv[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/pybv[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/pybv[${PYTHON_USEDEP}] )
	full? ( dev-python/pybv[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/pybv[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pydata-sphinx-theme-0.15.2[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/pydata-sphinx-theme-0.15.2[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pygments-2.13[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/pygments-2.13[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/pymatreader[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/pymatreader[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/pymatreader[${PYTHON_USEDEP}] )
	full? ( dev-python/pymatreader[${PYTHON_USEDEP}] )
	hdf5? ( dev-python/pymatreader[${PYTHON_USEDEP}] )
	>=dev-python/pyobjc-framework-cocoa-5.2.0[${PYTHON_USEDEP}]
	>=dev-python/pyobjc-framework-cocoa-5.2.0[${PYTHON_USEDEP}]
	>=dev-python/pyobjc-framework-cocoa-5.2.0[${PYTHON_USEDEP}]
	>=dev-python/pyobjc-framework-cocoa-5.2.0[${PYTHON_USEDEP}]
	full-pyqt6? ( !=dev-python/pyqt6-6.6.0[${PYTHON_USEDEP}] )
	full? ( !=dev-python/pyqt6-6.6.0[${PYTHON_USEDEP}] )
	full-pyqt6? ( !=dev-python/pyqt6-qt6-6.6.0[${PYTHON_USEDEP}] )
	full? ( !=dev-python/pyqt6-qt6-6.6.0[${PYTHON_USEDEP}] )
	full-pyside6? ( !=dev-python/pyside6-6.7.0[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/pytest-8.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest[${PYTHON_USEDEP}] )
	doc? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test-extra? ( >=dev-python/pytest-8.0[${PYTHON_USEDEP}] )
	test? ( >=dev-python/pytest-8.0[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-cov[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-qt[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/pytest-qt[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-qt[${PYTHON_USEDEP}] )
	dev? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/python-picard[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/python-picard[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/python-picard[${PYTHON_USEDEP}] )
	full? ( dev-python/python-picard[${PYTHON_USEDEP}] )
	full-no-qt? ( !=dev-python/pyvista-0.35.2[${PYTHON_USEDEP}] )
	full-pyqt6? ( !=dev-python/pyvista-0.35.2[${PYTHON_USEDEP}] )
	full-pyside6? ( !=dev-python/pyvista-0.35.2[${PYTHON_USEDEP}] )
	full? ( !=dev-python/pyvista-0.35.2[${PYTHON_USEDEP}] )
	full-no-qt? ( >=dev-python/pyvistaqt-0.4[${PYTHON_USEDEP}] )
	full-pyqt6? ( >=dev-python/pyvistaqt-0.4[${PYTHON_USEDEP}] )
	full-pyside6? ( >=dev-python/pyvistaqt-0.4[${PYTHON_USEDEP}] )
	full? ( >=dev-python/pyvistaqt-0.4[${PYTHON_USEDEP}] )
	dev? ( dev-python/pyxdf[${PYTHON_USEDEP}] )
	doc? ( dev-python/pyxdf[${PYTHON_USEDEP}] )
	dev? ( !=dev-python/pyzmq-24.0.0[${PYTHON_USEDEP}] )
	doc? ( !=dev-python/pyzmq-24.0.0[${PYTHON_USEDEP}] )
	full-no-qt? ( !=dev-python/qdarkstyle-3.2.2[${PYTHON_USEDEP}] )
	full-pyqt6? ( !=dev-python/qdarkstyle-3.2.2[${PYTHON_USEDEP}] )
	full-pyside6? ( !=dev-python/qdarkstyle-3.2.2[${PYTHON_USEDEP}] )
	full? ( !=dev-python/qdarkstyle-3.2.2[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/qtpy[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/qtpy[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/qtpy[${PYTHON_USEDEP}] )
	full? ( dev-python/qtpy[${PYTHON_USEDEP}] )
	dev? ( dev-python/rcssmin[${PYTHON_USEDEP}] )
	dev? ( dev-python/ruff[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/ruff[${PYTHON_USEDEP}] )
	test? ( dev-python/ruff[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	full? ( dev-python/scikit-learn[${PYTHON_USEDEP}] )
	>=dev-python/scipy-1.9[${PYTHON_USEDEP}]
	dev? ( !=dev-python/seaborn-0.11.2[${PYTHON_USEDEP}] )
	doc? ( !=dev-python/seaborn-0.11.2[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/selenium-4.27.1[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/selenium-4.27.1[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/sip[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/sip[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/sip[${PYTHON_USEDEP}] )
	full? ( dev-python/sip[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/snirf[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/snirf[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/snirf[${PYTHON_USEDEP}] )
	full? ( dev-python/snirf[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/snirf[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/sphinx-6[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-6[${PYTHON_USEDEP}] )
	dev? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-copybutton[${PYTHON_USEDEP}] )
	dev? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx-design[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/sphinx-gallery-0.16[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinx-gallery-0.16[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/sphinx-gallery[${PYTHON_USEDEP}] )
	dev? ( >=dev-python/sphinxcontrib-bibtex-2.5[${PYTHON_USEDEP}] )
	doc? ( >=dev-python/sphinxcontrib-bibtex-2.5[${PYTHON_USEDEP}] )
	dev? ( dev-python/sphinxcontrib-towncrier[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxcontrib-towncrier[${PYTHON_USEDEP}] )
	dev? ( dev-python/sphinxcontrib-youtube[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinxcontrib-youtube[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/statsmodels[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/statsmodels[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/statsmodels[${PYTHON_USEDEP}] )
	full? ( dev-python/statsmodels[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/statsmodels[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/threadpoolctl[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/threadpoolctl[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/threadpoolctl[${PYTHON_USEDEP}] )
	full? ( dev-python/threadpoolctl[${PYTHON_USEDEP}] )
	dev? ( dev-python/toml-sort[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/toml-sort[${PYTHON_USEDEP}] )
	test? ( dev-python/toml-sort[${PYTHON_USEDEP}] )
	dev? ( <dev-python/towncrier-24.7[${PYTHON_USEDEP}] )
	doc? ( <dev-python/towncrier-24.7[${PYTHON_USEDEP}] )
	dev-python/tqdm[${PYTHON_USEDEP}]
	full-no-qt? ( dev-python/traitlets[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/traitlets[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/traitlets[${PYTHON_USEDEP}] )
	full? ( dev-python/traitlets[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/trame[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/trame[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/trame[${PYTHON_USEDEP}] )
	full? ( dev-python/trame[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/trame-vtk[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/trame-vtk[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/trame-vtk[${PYTHON_USEDEP}] )
	full? ( dev-python/trame-vtk[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/trame-vuetify[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/trame-vuetify[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/trame-vuetify[${PYTHON_USEDEP}] )
	full? ( dev-python/trame-vuetify[${PYTHON_USEDEP}] )
	dev? ( dev-python/twine[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/twine[${PYTHON_USEDEP}] )
	test? ( dev-python/twine[${PYTHON_USEDEP}] )
	full-no-qt? ( >=dev-python/vtk-9.2[${PYTHON_USEDEP}] )
	full-pyqt6? ( >=dev-python/vtk-9.2[${PYTHON_USEDEP}] )
	full-pyside6? ( >=dev-python/vtk-9.2[${PYTHON_USEDEP}] )
	full? ( >=dev-python/vtk-9.2[${PYTHON_USEDEP}] )
	dev? ( dev-python/vulture[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/vulture[${PYTHON_USEDEP}] )
	test? ( dev-python/vulture[${PYTHON_USEDEP}] )
	dev? ( dev-python/wheel[${PYTHON_USEDEP}] )
	test-extra? ( dev-python/wheel[${PYTHON_USEDEP}] )
	test? ( dev-python/wheel[${PYTHON_USEDEP}] )
	full-no-qt? ( dev-python/xlrd[${PYTHON_USEDEP}] )
	full-pyqt6? ( dev-python/xlrd[${PYTHON_USEDEP}] )
	full-pyside6? ( dev-python/xlrd[${PYTHON_USEDEP}] )
	full? ( dev-python/xlrd[${PYTHON_USEDEP}] )
	dev? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
	test-extra? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
	test? ( dev-vcs/pre-commit[${PYTHON_USEDEP}] )
"
RDEPEND="${GENERATED_DEPEND}"

distutils_enable_tests pytest