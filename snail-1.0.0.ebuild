# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="Snail - nVidia Optimus support"

SRC_URI="ftp://backbone.ws/projects/snail/snail-1.0.0.tar.bz2"

HOMEPAGE="https://chili.backbone.ws/projects/snail"

KEYWORDS="-* ~x86 ~amd64"

SLOT="0"

LICENSE="GPL-3"

IUSE=""

DEPEND="x11-drivers/nvidia-drivers"

RDEPEND="${DEPEND}"

src_install() {
	echo "src_install=`pwd`" >>/tmp/snail.log
	emake install DESTDIR="${D}" || die
}

pkg_postinst() {
	snail.configure
}

