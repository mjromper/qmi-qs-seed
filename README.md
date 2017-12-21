# Qlik Sense Seed Project

## Description
This is the Markdown file to inform users about this scenario. Add here any content you think is insteresting to be known about this scenario.

## Implementing a custom scenario

### Pre-requisites
- Install Vagrant
- Install Virtualbox
- Have provisioned a QMI built-in scenario once at least. It provides with base scripts (shared-content folder)


### Steps
1. Clone this repository in *~/QlikMachineImages/personal* folder. Change folder name with your scenario key name: *qmi-...*
2. Modify *scenario.json* attributes to meet your configuration. Some notes are:
   - **name** - it has to start by *qmi-...* and no spaces (same as 1.). Replace *qmi-qs-seed* everywhere in this file with your scenario key name
   - **description** - short description/title
   - **category** - always set to *Qlik Sense*
   - **custom** - always set to *true*
   - **plugin-dependencies** - list of needed vagrant plugins
   - **config.servers** - array of servers (VMs) to deploy.
     - **sense** - if exists it will install Qlik Sense with specified configuration. 

3. Edit shared persistence configuration file *./files/sp-config.xml* with the hostname of your scenario.

4. Modify markdown README.md file to describe your scenario in detail. This file is the information page for the users of your scenario, include details such: itent, description, software installed, URLs, users, support information, etc.

5. Test provision. Type `vagrant up` to run provision and `vagrant destroy -f` to delete. Repeat until success.

6. Zip the content folder. Destroy the VM before zipping (`vagrant destroy -f`)

7. Share it.
