
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_SERVER_VERSION = 'b3e71d7e58188e9231e961b3d48cc6f97a48ad03'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_SERVER_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-rafaelcalai.git'
AESD_SERVER_SITE_METHOD = git
AESD_SERVER_GIT_SUBMODULES = YES

define AESD_SERVER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server clean
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all CROSS_COMPILE=$(TARGET_CC)
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_SERVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
