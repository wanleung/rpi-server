#!/usr/bin/perl
###########################################################################
###    rpi-server - Raspberry Pi Perl Web services server
###    Copyright (C) 2013  Wan Leung Wong (me at wanleung dot com)
###
###    This program is free software: you can redistribute it and/or modify
###    it under the terms of the GNU General Public License as published by
###    the Free Software Foundation, either version 3 of the License, or
###    (at your option) any later version.
###
###    This program is distributed in the hope that it will be useful,
###    but WITHOUT ANY WARRANTY; without even the implied warranty of
###    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
###    GNU General Public License for more details.
###
###    You should have received a copy of the GNU General Public License
###    along with this program.  If not, see <http://www.gnu.org/licenses/>.
############################################################################
use Device::BCM2835;
use strict;

# call set_debug(1) to do a non-destructive test on non-RPi hardware
#Device::BCM2835::set_debug(1);
Device::BCM2835::init() || die "Could not init library";

Device::BCM2835::gpio_fsel(&Device::BCM2835::RPI_GPIO_P1_13, 
                           &Device::BCM2835::BCM2835_GPIO_FSEL_OUTP);

Device::BCM2835::gpio_fsel(&Device::BCM2835::RPI_GPIO_P1_11,
                           &Device::BCM2835::BCM2835_GPIO_FSEL_INPT);

Device::BCM2835::gpio_fsel(&Device::BCM2835::RPI_GPIO_P1_15,
                           &Device::BCM2835::BCM2835_GPIO_FSEL_OUTP);

Device::BCM2835::gpio_fsel(&Device::BCM2835::RPI_GPIO_P1_16,
                           &Device::BCM2835::BCM2835_GPIO_FSEL_OUTP);

Device::BCM2835::gpio_fsel(&Device::BCM2835::RPI_GPIO_P1_18,
                           &Device::BCM2835::BCM2835_GPIO_FSEL_OUTP);

while (1) {
    # Turn it on
    Device::BCM2835::gpio_write(&Device::BCM2835::RPI_GPIO_P1_13, 1);
    Device::BCM2835::gpio_write(&Device::BCM2835::RPI_GPIO_P1_15, 0);
    Device::BCM2835::gpio_write(&Device::BCM2835::RPI_GPIO_P1_16, 0);
    Device::BCM2835::gpio_write(&Device::BCM2835::RPI_GPIO_P1_18, 1);
    Device::BCM2835::delay(500); # Milliseconds
    # Turn it off
    Device::BCM2835::gpio_write(&Device::BCM2835::RPI_GPIO_P1_13, 0);
    Device::BCM2835::gpio_write(&Device::BCM2835::RPI_GPIO_P1_15, 1);
    Device::BCM2835::gpio_write(&Device::BCM2835::RPI_GPIO_P1_16, 1);
    Device::BCM2835::gpio_write(&Device::BCM2835::RPI_GPIO_P1_18, 0);
    Device::BCM2835::delay(500); # Milliseconds
    my $pin = Device::BCM2835::gpio_lev(&Device::BCM2835::RPI_GPIO_P1_11);
    if ($pin == HIGH) {
        print "HIGH\n";
    } else {
        print "LOW\n";
    }
}
