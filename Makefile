SHELL = /bin/sh
PREFIX = /usr

all:

install:
	install -d ${DESTDIR}/etc/X11
	install --mode=644 etc/X11/* ${DESTDIR}/etc/X11
	install -d ${DESTDIR}/etc/init.d
	install etc/init.d/* ${DESTDIR}/etc/init.d
	install -d ${DESTDIR}/${PREFIX}/bin
	install bin/* ${DESTDIR}/${PREFIX}/bin
	install -d ${DESTDIR}/${PREFIX}/sbin
	install sbin/* ${DESTDIR}/${PREFIX}/sbin
	install -d ${DESTDIR}/${PREFIX}/lib64
	install lib64/*.so ${DESTDIR}/${PREFIX}/lib64
	install -d ${DESTDIR}/${PREFIX}/lib64/snail
	ln -sf /usr/lib64/opengl/nvidia/extensions ${DESTDIR}/${PREFIX}/lib64/snail
	install -d ${DESTDIR}/${PREFIX}/lib64/snail/modules
	ln -sf /usr/lib64/xorg/modules/drivers ${DESTDIR}/${PREFIX}/lib64/snail/modules
	ln -sf /usr/lib64/xorg/modules/extensions ${DESTDIR}/${PREFIX}/lib64/snail/modules
	ln -sf /usr/lib64/xorg/modules/libfb.so ${DESTDIR}/${PREFIX}/lib64/snail/modules
	ln -sf /usr/lib64/xorg/modules/libwfb.so ${DESTDIR}/${PREFIX}/lib64/snail/modules

uninstall:
	rm -f ${DESTDIR}/etc/X11/xorg.conf.*.snail
	rm -f ${DESTDIR}/etc/init.d/snail-*
	rm -f ${DESTDIR}/${PREFIX}/lib64/libdlfaker.so
	rm -f ${DESTDIR}/${PREFIX}/lib64/libgefaker.so
	rm -f ${DESTDIR}/${PREFIX}/lib64/librrfaker.so
	rm -rf ${DESTDIR}/${PREFIX}/lib64/snail
	rm -f ${DESTDIR}/${PREFIX}/bin/nvrun
	rm -f ${DESTDIR}/${PREFIX}/bin/snail.vglrun
	rm -f ${DESTDIR}/${PREFIX}/sbin/snail.nv_pwr_off
	rm -f ${DESTDIR}/${PREFIX}/sbin/snail.nv_pwr_on
	rm -f ${DESTDIR}/${PREFIX}/sbin/snail-watcher.sh
	rm -f ${DESTDIR}/${PREFIX}/sbin/snail.configure
