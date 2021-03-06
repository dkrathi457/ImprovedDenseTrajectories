# set the binaries that have to be built
TARGETS := DenseTrackStabOrig Video

# set the build configuration set
BUILD := release
#BUILD := debug

# set bin and build dirs
BUILDDIR := .build_$(BUILD)
BINDIR := $(BUILD)

# libraries
LDLIBS = $(addprefix -l, $(LIBS) $(LIBS_$(notdir $*)))
LIBS := \
	opencv_core opencv_highgui opencv_video opencv_imgproc opencv_calib3d opencv_features2d opencv_nonfree opencv_flann opencv_gpu \
	avformat avdevice avutil avcodec swscale

# set some flags and compiler/linker specific commands
CXXFLAGS = -pipe -D __STDC_CONSTANT_MACROS -D STD=std -Werror $(CXXFLAGS_$(BUILD)) -I. -I/opt/include
CXXFLAGS_debug := -ggdb
CXXFLAGS_release := -O3 -DNDEBUG -ggdb
LDFLAGS = -L/opt/lib -L/home/trunia1/dev/lib/opencv/2.4/install/lib -pipe -Wall $(LDFLAGS_$(BUILD))
LDFLAGS_debug := -ggdb
LDFLAGS_release := -O3 -ggdb

include make/generic.mk
