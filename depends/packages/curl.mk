package=curl
$(package)_version=7.63.0
$(package)_download_path=https://curl.haxx.se/download
$(package)_file_name=$(package)-$($(package)_version).tar.gz
$(package)_sha256_hash=d483b89062832e211c887d7cf1b65c902d591b48c11fe7d174af781681580b41

define $(package)_set_vars
endef

define $(package)_config_cmds
  ./configure --host=x86_64-w64-mingw32 --disable-pthreads --without-ssl --with-winssl --prefix=$(host_prefix)
endef

define $(package)_build_cmds
  $(MAKE)
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install
endef

