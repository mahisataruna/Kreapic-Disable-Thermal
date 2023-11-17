##########################################################################################
#
# Magisk Module Template Config Script
# by topjohnwu
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure the settings in this file (config.sh)
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

SKIPMOUNT=false

PROPFILE=true

POSTFSDATA=true

LATESTARTSERVICE=true

REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"


REPLACE="
"

print_modname() {
  ui_print "      Kreapic Disable Thermal Version 1.0     "
busybox sleep 1
  ui_print "                   "
busybox sleep 1
  ui_print " By : Kreapic "
busybox sleep 1
  ui_print " Install BusyBox"
busybox sleep 5
  ui_print "                   "
  busybox sleep 1
  ui_print "         Please wait..          "
  ui_print "                   "
  busybox sleep 1
  ui_print "                 Loading..."
  busybox sleep 1
  ui_print "                 Installing..."
  ui_print "                 Wait.."
  busybox sleep 1
  ui_print " Installing success "
  busybox sleep 1
  ui_print " Reboot Your Device "
}


# Copy/extract your module files into $MODPATH in on_install.

on_install() {
  # The following is the default implementation: extract $ZIPFILE/system to $MODPATH
  # Extend/change the logic to whatever you want
  ui_print "- Extracting module files"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

# Only some special files require specific permissions
# This function will be called after on_install is done
# The default permissions should be good enough for most cases

set_permissions() {
  # The following is the default rule, DO NOT remove
  set_perm_recursive $MODPATH 0 0 0755 0644
  set_perm $MODPATH/system/bin/P0 0 0 0755 0755
  set_perm $MODPATH/system/bin/P1 0 0 0755 0755

  # Here are some examples:
  # set_perm_recursive  $MODPATH/system/lib       0     0       0755      0644
  # set_perm  $MODPATH/system/bin/app_process32   0     2000    0755      u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0     2000    0755      u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0     0       0644
}

# You can add more functions to assist your custom script code
