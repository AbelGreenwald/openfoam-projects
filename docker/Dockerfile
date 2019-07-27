FROM nvidia/cuda:8.0-devel

RUN apt-get update && apt-get install -y sudo git-core build-essential binutils-dev cmake flex \
zlib1g-dev qt4-dev-tools libqt4-dev libncurses5-dev libiberty-dev \
libxt-dev rpm mercurial graphviz python python-dev openmpi-bin libopenmpi-dev x11-apps

RUN useradd -s /bin/bash -m openfoam -G sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir foam && git clone https://github.com/Unofficial-Extend-Project-Mirror/foam-extend-foam-extend-3.2.git foam/foam-extend-3.2

git clone https://github.com/cusplibrary/cusplibrary.git
cp -r cusplibrary/cusp /usr/local/cuda/include/

WORKDIR foam/foam-extend-3.2
RUN cp etc/prefs.sh{-EXAMPLE,}
RUN source foam/foam-extend-3.2/etc/bashrc

ENV CUDA_ARCH sm_20
ENV QT_BIN_DIR /usr/bin/qmake
ENV CUDA_BIN_DIR /usr/local/cuda/bin/
ENV CUDA_LIB_DIR /usr/local/cuda/lib/

RUN echo "export QT_BIN_DIR=$QT_BIN_DIR" >> foam/foam-extend-3.2/etc/prefs.sh
#RUN echo "export CUDA_ARCH=$CUDA_ARCH" >> foam/foam-extend-3.2/etc/prefs.sh



ENV DISPLAY ":0"
#RUN "echo export WM_THIRD_PARTY_USE_BISON_27=1  >> foam/foam-extend-3.2/etc/prefs.sh"

RUN echo "alias fe32='source \$HOME/foam/foam-extend-3.2/etc/bashrc'" >> $HOME/.bashrc

# ENTRYPOINT [ "/bin/bash", "-rcfile", "/opt/OpenFOAM/setImage_v1806.sh" ]
WORKDIR /root/foam/foam-extend-3.2/

# Important: This will take hours
#RUN ./Allwmake.firstInstall

CUDA_INCLUDE_DIR
Important note I added  -I/usr/local/cuda/include/cusp/ to src/cudaSolvers/Make/options
also all commands from install instructions doc/buildInstructions/Debian/Ubuntu/Ubuntu_14.04
/usr/local/cuda/lib64:/usr/local/cuda/lib64/stubs:/usr/lib/openmpi/lib:/root/foam/foam-extend-3.2/lib/linux64GccDPOpt

export CUDA_DIR=/usr/local/cuda
export CUDA_BIN_DIR=$CUDA_DIR/bin

note: install http://glaros.dtc.umn.edu/gkhome/fetch/sw/parmetis/parmetis-4.0.3.tar.gz

tried cp -r ../../../../cusp/cusp ./include/



with cuda:
186.62

without cuda:
1.44
