<#
Intent: Main powershell routine of the provision process
#>

# Disable Password complexity, create Qlik user and grant remote desktop rights
& c:\shared-content\scripts\modules\q-user-setup.ps1

# Download the Qlik Sense binary selected by the end user of QMI.
& c:\shared-content\scripts\modules\qs-getBinary.ps1

# Download and install Access Database engine to support ODBC connectivity to excel and access files
& c:\shared-content\scripts\modules\q-AccessDatabaseEngine.ps1

# Configure Server for Qlik Sense installation
& c:\shared-content\scripts\modules\qs-initial-cfg.ps1

# Install the selected version of Qlik Sense (silently)
& c:\shared-content\scripts\modules\qs-install.ps1

# Configure the Qlik Sense environment with applications and Security Rules
& c:\shared-content\scripts\modules\qs-post-cfg.ps1

# Installation of Patch for Qlik Sense if selected product version has a Patch
& c:\shared-content\scripts\modules\qs-update.ps1

<#
# Some Qlik Sense add-ons

# Qlik Web Connectors
& c:\shared-content\scripts\modules\q-WebConnectors.ps1

# GeoAnalytics
& c:\shared-content\scripts\modules\qs-geoAnalytics.ps1

# License Qlik Sense Data Market premium content packages
& c:\shared-content\scripts\modules\qs-dataMarket.ps1

# Import reference data for Qlik Sense applications
& c:\shared-content\scripts\modules\qs-importData.ps1
#>

# Finish provision. Set windows lincense. Update hosts (networking). Display summary information.
& c:\shared-content\scripts\modules\q-provisioned.ps1

