PRODUCT_PACKAGES += \
	libvex-arm-linux \
	libcoregrind-arm-linux \
	libreplacemalloc_toolpreload-arm-linux \
	vgpreload_core-arm-linux \
	memcheck-arm-linux \
	vgpreload_memcheck-arm-linux \
	cachegrind-arm-linux \
	callgrind-arm-linux \
	helgrind-arm-linux \
	vgpreload_helgrind-arm-linux \
	drd-arm-linux \
	vgpreload_drd-arm-linux \
	massif-arm-linux \
	vgpreload_massif-arm-linux \
	none-arm-linux \
	vgdb \
	valgrind \
	default.supp \
	$(NULL)

PRODUCT_COPY_FILES += \
	external/valgrind/coregrind/m_gdbserver/arm-core-valgrind-s1.xml:/system/lib/valgrind/arm-core-valgrind-s1.xml \
	external/valgrind/coregrind/m_gdbserver/arm-core-valgrind-s2.xml:/system/lib/valgrind/arm-core-valgrind-s2.xml \
	external/valgrind/coregrind/m_gdbserver/arm-core.xml:/system/lib/valgrind/arm-core.xml \
	external/valgrind/coregrind/m_gdbserver/arm-vfpv3-valgrind-s1.xml:/system/lib/valgrind/arm-vfpv3-valgrind-s1.xml \
	external/valgrind/coregrind/m_gdbserver/arm-vfpv3-valgrind-s2.xml:/system/lib/valgrind/arm-vfpv3-valgrind-s2.xml \
	external/valgrind/coregrind/m_gdbserver/arm-vfpv3.xml:/system/lib/valgrind/arm-vfpv3.xml \
	external/valgrind/coregrind/m_gdbserver/arm-with-vfpv3-valgrind.xml:/system/lib/valgrind/arm-with-vfpv3-valgrind.xml
