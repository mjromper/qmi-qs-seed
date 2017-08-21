$config = (Get-Content c:\vagrant\files\qs-cfg.json -raw) | ConvertFrom-Json

& c:\shared-content\scripts\modules\q-user-setup.ps1

If ( $config.servers.sense ) {

	& c:\shared-content\scripts\modules\qs-getBinary.ps1

	& c:\shared-content\scripts\modules\q-AccessDatabaseEngine.ps1

	& c:\shared-content\scripts\modules\qs-initial-cfg.ps1

	& c:\shared-content\scripts\modules\qs-install.ps1

	& c:\shared-content\scripts\modules\qs-post-cfg.ps1

	# Add Industry Solution apps
	If ( $config.servers.sense.options.industry -eq $true ) {
		& c:\shared-content\scripts\modules\qs-industry-solutions.ps1
	}

	# Add Advance Analytics Integration (R)
	If ( $config.servers.sense.options.aai -eq $true ) {
		& c:\shared-content\scripts\modules\qs-installR.ps1
	}

	# Support for QS Patches
	If ( $config.servers.sense.options.patchSupport -eq $true ) {
		& c:\shared-content\scripts\modules\qs-update.ps1
	}

	# Add Web connetors
	If ( $config.servers.sense.options.webConnetors -eq $true ) {
		& c:\shared-content\scripts\modules\q-WebConnectors.ps1
	}

	# Add Geonalytics
	If ( $config.servers.sense.options.geo -eq $true ) {
		& c:\shared-content\scripts\modules\qs-geoAnalytics.ps1
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

& c:\shared-content\scripts\modules\q-provisioned.ps1

