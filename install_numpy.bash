#!/bin/bash

# Install numpy dependency - setuptools, python-dev

CMD1="sudo python ~/downloads/python-setuptools/ez_setup.py"

CMD2="sudo python ~/downloads/dev-0.4.0/setup.py install"

if eval "$CMD1"; then
	echo Successfully installed python setuptools
else
	echo Failed to install python setuptools
	exit $?
fi

if eval "$CMD2"; then
	echo Successfully installed python dev
else
	echo Failed to install python dev
	exit $?
fi
