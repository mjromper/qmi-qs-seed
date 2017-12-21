# Qlik Sense Seed Project

## Description
This is the Markdown file to inform users about this scenario. Add here any content you think is insteresting to be known about this scenario.

## Start implementing a custom scenario
- Clone this repository in *~/QlikMachineImages/personal* folder
- Modify *scenario.json* attributes to meet your configuration. Some notes are:
  - **name** - it has to start by *qmi-...* and no spaces. Replace *qmi-qs-seed* everywhere in this file with your scenario name
  - **description** - short description/title.
  - **category** - always set to *Qlik Sense*
  - **custom** - always set to *true*
  - **plugin-dependencies** - list of needed vagrant plugins
  - **config.servers** - array of servers (VMs) to deploy.
    - **sense** - if exists it will install Qlik Sense with specified configuration.

- Edit shared persistence configuration file *./files/sp-config.xml* with the hostname of your scenario.

- Modify markdown README.md file to describe your scenario in detail. This file is the information page for the users of your scenario, include details such: itent, description, software installed, URLs, users, support information, etc.
