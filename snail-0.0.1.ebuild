# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="Snail - nVidia Optimus support in a simple way"

SRC_URI="ftp://backbone.myftp.org/projects/snail/snail-0.0.1.tar.gz"

HOMEPAGE="http://backbone.myftp.org/projects/snail"

KEYWORDS="-* ~x86 ~amd64"

SLOT="0"

LICENSE="GPL-3"

IUSE=""

DEPEND="x11-drivers/nvidia-drivers"

RDEPEND="${DEPEND}"

src_prepare() {
	echo "src_prepare=`pwd`" >>/tmp/snail.log
}

src_configure() {
	echo "src_configure=`pwd`" >>/tmp/snail.log
}

src_compile() {
	echo "src_compile=`pwd`" >>/tmp/snail.log
}

src_install() {
	echo "src_install=`pwd`" >>/tmp/snail.log
}

pkg_postinst() {
	echo "src_postinst=`pwd`" >>/tmp/snail.log
}

