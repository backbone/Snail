SHELL = /bin/sh
PREFIX = /usr/local

all:

install:
	install etc/X11/* /etc/X11
	install etc/init.d/* /etc/init.d
	install bin/* ${PREFIX}/bin
	install sbin/* ${PREFIX}/sbin
	install lib64/*.so ${PREFIX}/lib64
	install -d ${PREFIX}/lib64/snail
	ln -sf /usr/lib64/opengl/nvidia/extensions ${PREFIX}/lib64/snail/extensions
	install -d ${PREFIX}/lib64/snail/modules
	ln -sf /usr/lib64/xorg/modules/drivers ${PREFIX}/lib64/snail/modules/drivers
	ln -sf /usr/lib64/xorg/modules/extensions ${PREFIX}/lib64/snail/modules/extensions
	ln -sf /usr/lib64/xorg/modules/libfb.so ${PREFIX}/lib64/snail/modules/libfb.so
	ln -sf /usr/lib64/xorg/modules/libwfb.so ${PREFIX}/lib64/snail/modules/libwfb.so

uninstall:
	rm -f /etc/X11/xorg.conf.*.snail
	rm -f /etc/init.d/snail-*
	rm -f ${PREFIX}/lib64/libdlfaker.so
	rm -f ${PREFIX}/lib64/libgefaker.so
	rm -f ${PREFIX}/lib64/librrfaker.so
	rm -rf ${PREFIX}/lib64/snail
	rm -f ${PREFIX}/bin/nvrun
	rm -f ${PREFIX}/bin/snail.vglrun
	rm -f ${PREFIX}/sbin/snail.nv_pwr_off
	rm -f ${PREFIX}/sbin/snail.nv_pwr_on
	rm -f ${PREFIX}/sbin/snail-watcher.sh
	rm -f ${PREFIX}/sbin/snail.configure
