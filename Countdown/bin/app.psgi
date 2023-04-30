#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";


# use this block if you don't need middleware, and only have a single target Dancer app to run here
use Countdown;

Countdown->to_app;

=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use Countdown;
use Plack::Builder;

builder {
    enable 'Deflater';
    Countdown->to_app;
}

=end comment

=cut

=begin comment
# use this block if you want to mount several applications on different path

use Countdown;
use Countdown_admin;

use Plack::Builder;

builder {
    mount '/'      => Countdown->to_app;
    mount '/admin'      => Countdown_admin->to_app;
}

=end comment

=cut

