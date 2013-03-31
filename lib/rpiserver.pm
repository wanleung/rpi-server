package rpiserver;
use Dancer ':syntax';
use Device::BCM2835;

our $VERSION = '0.1';

Device::BCM2835::init();

get '/set/:pin/:type' => sub {
    my $in = param('pin');
    my $pin;
    ($in eq '3') and ($pin = &RPI_GPIO_P1_03);
    ($in eq '5') and ($pin = &RPI_GPIO_P1_05);
    ($in eq '7') and ($pin = &RPI_GPIO_P1_07);
    ($in eq '8') and ($pin = &RPI_GPIO_P1_08);
    ($in eq '10') and ($pin = &RPI_GPIO_P1_10);
    ($in eq '11') and ($pin = &RPI_GPIO_P1_11);
    ($in eq '12') and ($pin = &RPI_GPIO_P1_12);
    ($in eq '13') and ($pin = &RPI_GPIO_P1_13);
    ($in eq '15') and ($pin = &RPI_GPIO_P1_15);
    ($in eq '16') and ($pin = &RPI_GPIO_P1_16);
    ($in eq '18') and ($pin = &RPI_GPIO_P1_18);
    ($in eq '19') and ($pin = &RPI_GPIO_P1_19);
    ($in eq '21') and ($pin = &RPI_GPIO_P1_21);
    ($in eq '22') and ($pin = &RPI_GPIO_P1_22);
    ($in eq '23') and ($pin = &RPI_GPIO_P1_23);
    ($in eq '24') and ($pin = &RPI_GPIO_P1_24);
    ($in eq '26') and ($pin = &RPI_GPIO_P1_26);
    if (! $pin) {
        return "No such pin $in available";
    }
    my $tin = param('type');
    my $type;
    if ($tin eq "read") {
        $type = &BCM2835_GPIO_FSEL_INPT;
    } elsif ($tin eq "write") {
        $type = &BCM2835_GPIO_FSEL_OUTP;
    } else {
        return "Type only can be either read or write";
    } 
    Device::BCM2835::gpio_fsel($pin, $type);
    return "OK";
};

get '/pin/:pin/:value' => sub {
    my $in = param('pin');
    my $pin;
    ($in eq '3') and ($pin = &RPI_GPIO_P1_03);
    ($in eq '5') and ($pin = &RPI_GPIO_P1_05);
    ($in eq '7') and ($pin = &RPI_GPIO_P1_07);
    ($in eq '8') and ($pin = &RPI_GPIO_P1_08);
    ($in eq '10') and ($pin = &RPI_GPIO_P1_10);
    ($in eq '11') and ($pin = &RPI_GPIO_P1_11);
    ($in eq '12') and ($pin = &RPI_GPIO_P1_12);
    ($in eq '13') and ($pin = &RPI_GPIO_P1_13);
    ($in eq '15') and ($pin = &RPI_GPIO_P1_15);
    ($in eq '16') and ($pin = &RPI_GPIO_P1_16);
    ($in eq '18') and ($pin = &RPI_GPIO_P1_18);
    ($in eq '19') and ($pin = &RPI_GPIO_P1_19);
    ($in eq '21') and ($pin = &RPI_GPIO_P1_21);
    ($in eq '22') and ($pin = &RPI_GPIO_P1_22);
    ($in eq '23') and ($pin = &RPI_GPIO_P1_23);
    ($in eq '24') and ($pin = &RPI_GPIO_P1_24);
    ($in eq '26') and ($pin = &RPI_GPIO_P1_26);
    if (! $pin) {
        return "No such pin $in available";
    }
    my $vin = param('value');
    my $value;
    if ($vin eq "1") {
        $value = 1;
    } elsif ($vin eq "0") {
        $value = 0;
    } else {
        return "Value only can be either 1 or 0";
    } 
    Device::BCM2835::gpio_write($pin, $value);
    return "OK";
};

get '/pin/:pin' => sub {
    my $in = param('pin');
    my $pin;
    ($in eq '3') and ($pin = &RPI_GPIO_P1_03);
    ($in eq '5') and ($pin = &RPI_GPIO_P1_05);
    ($in eq '7') and ($pin = &RPI_GPIO_P1_07);
    ($in eq '8') and ($pin = &RPI_GPIO_P1_08);
    ($in eq '10') and ($pin = &RPI_GPIO_P1_10);
    ($in eq '11') and ($pin = &RPI_GPIO_P1_11);
    ($in eq '12') and ($pin = &RPI_GPIO_P1_12);
    ($in eq '13') and ($pin = &RPI_GPIO_P1_13);
    ($in eq '15') and ($pin = &RPI_GPIO_P1_15);
    ($in eq '16') and ($pin = &RPI_GPIO_P1_16);
    ($in eq '18') and ($pin = &RPI_GPIO_P1_18);
    ($in eq '19') and ($pin = &RPI_GPIO_P1_19);
    ($in eq '21') and ($pin = &RPI_GPIO_P1_21);
    ($in eq '22') and ($pin = &RPI_GPIO_P1_22);
    ($in eq '23') and ($pin = &RPI_GPIO_P1_23);
    ($in eq '24') and ($pin = &RPI_GPIO_P1_24);
    ($in eq '26') and ($pin = &RPI_GPIO_P1_26);
    if (! $pin) {
        return "No such pin $in available";
    }

    my $value = Device::BCM2835::gpio_lev($pin);
    if ($value == HIGH) {
        return "1";
    } else {
        return "0";
    }

};

true;
