# WELCOME
Welcome to the Honeypot Administration Tool (HAT)! This tool is intended to increase the efficiency and ease of some frequently-used workflows for dionaea honeypot management.

# THINGS TO KNOW
dionaea stops collecting new malware samples when the dionaea.log file reaches 2.0 GBs.
dionaea stores the binaries that it catches in the following path by default: /opt/dionaea/var/lib/binaries/	. If your installation stores the binaries in a different location, be sure to keep that in mind if debugging the HAT becomes bothersome.
The HAT assumes a standard installation of dionaea (which can easily be achieved by using the automatically-generated script provided by the Modern Honeypot Network). This means that any hardcoded paths in HAT operate based on this assumption.
The HAT and all accompanying scripts should be placed in either the ~/bin directory or the /bin directory (depending on your user’s level of privilege) to ensure that the scripts can call each other correctly.

# SETUP
To have the tool execute correctly, the tool must be able to execute the helper script(s) that it makes use of (such as sampleScanner). To enable this, do the following:
Once the provided ZIP file has been decompressed, ensure that the “hat” and the “sampleScanner” scripts are included.
Locate the appropriate */bin directory that you would like to use. NOTE: /bin allows for root to execute from anywhere. ~/bin may have to be created and may or may not be automatically supported and hooked into by your distribution, but would only allow your user to use the HAT. The appropriate choice will depend on your level of privilege.
Move or copy the scripts from the decompressed ZIP file into the chosen bin directory.
Install the VirusTotalApi tool found at the following GitHub page: https://github.com/doomedraven/VirusTotalApi
Run the HAT to ensure that the tool executes correctly.

Alternatively, you can make use of the installer (installer.sh) that has been included since HAT version 0.4. If, after using the installer, the tool is not working properly, check for fulfillment of the points above from the manual installation instructions.

# RUNNING THE SCRIPT
To run the HAT, simply execute the tool by executing ($ just means execute in the terminal):
$ hat
## NOTE: Not all capabilities of the HAT will be available without running the tool as root

To run the tool as root (to access more capabilities), execute the following:
$ sudo hat
## NOTE: Always be careful with any file manipulations when using sudo

Once the tool has been executed, the tool will prompt you for any interaction that it needs.

# CURRENT CAPABILITIES
Capabilities that begin with ROOT can only be used when running HAT as root.
Output the current number of caught binaries
Output the current size of the dionaea log file
ROOT: Reset the dionaea log file by deleting the current file and creating a new, empty log file and restarting the dionaea service
Output the current list of binaries (as a Filtered or Unfiltered list, or No list to skip this capability)
The Filtered list does not contain any of the zero-sized “http*” files that dionaea includes in its */binaries/ directory.
The Unfiltered list contains all files in the */binaries/ directory.
The No list option skips the printing of a list of binaries.
ROOT: Copy the binaries from the directory where they are stored by dionaea into a user-specified directory.
Run VirusTotal scans on all of the binaries in the specified directory. (The user must have access privileges to the specified directory) using the Sample Scanner tool (provided alongside HAT). This capability currently runs into an error when running as root.
The following VirusTotalApi tool is required for this capability: https://github.com/doomedraven/VirusTotalApi

# KNOWN ISSUES
Currently, once the tool is correctly installed to the /bin directory, the Sample Scanner tool may produce some issues regarding some Python libraries not being accessible (among ones that have had these issues are python.dateutil and texttable).

To fix the issues with python.dateutil and texttable, run the following two commands:

$ sudo pip install python-dateutil --upgrade
$ sudo pip install texttable --upgrade

You should now be able to run HAT as root and use the VirusTotal scanning capability run by Sample Scanner and vt.py.
