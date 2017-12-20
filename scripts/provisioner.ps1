<#
Intent: Main powershell routine of the provision process
#>

$config = (Get-Content c:\vagrant\files\qs-cfg.json -raw) | ConvertFrom-Json

# Disable Password complexity, create Qlik user and grant remote desktop rights
& c:\shared-content\scripts\modules\q-user-setup.ps1

If ( $config.servers.sense ) {

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

	# Import reference data for Qlik Sense applications
	# Dependencies:
	# - Requires creation of ReferenceData and ContentLibrary folders under shared-content directory.
	& c:\shared-content\scripts\modules\qs-importData.ps1

	# Acquire, install and configure Qlik Web Connectors
	# Dependencies:
 	# - Addition of LicenseSetttings.xml and UserSettings.xml to c:\shared-content\files\QlikWebConnectors\
	If ( $config.servers.sense.options.webConnetors -eq $true ) {
		& c:\shared-content\scripts\modules\q-WebConnectors.ps1
	}

	# Download and install geoAnalytics
	If ( $config.servers.sense.options.geo -eq $true ) {
		& c:\shared-content\scripts\modules\qs-geoAnalytics.ps1
	}

	# License Qlik Sense Data Market premium content packages
	# Dependencies:
	# - Requires updated version of qlik-license.json to include datamarket license details.
	If ( $config.servers.sense.options.dataMarket -eq $true ) {
		& c:\shared-content\scripts\modules\qs-dataMarket.ps1
	}

	# Add Industry Solution apps
	If ( $config.servers.sense.options.industry -eq $true ) {
		& c:\shared-content\scripts\modules\qs-industry-solutions.ps1
	}

	# Add Advance Analytics Integration (R)
	If ( $config.servers.sense.options.aai -eq $true ) {
		& c:\shared-content\scripts\modules\qs-installR.ps1
	}

	# Add Ticket Authentication with Google
	If ( $config.servers.sense.options.authGoogle -eq $true ) {
		& c:\shared-content\scripts\modules\qs-ticketauth-google.ps1
	}

	# Add Ticket Authentication with Office 365
	If ( $config.servers.sense.options.authOffice365 -eq $true ) {
		& c:\shared-content\scripts\modules\qs-ticketauth-office365.ps1
	}
}

# Finish provision. Set windows lincense. Update hosts (networking). Display summary information.
& c:\shared-content\scripts\modules\q-provisioned.ps1

