package Countdown;

use Dancer2;
use Dancer2::Plugin::DBIC;
use JSON;

set serializer => 'JSON';

# Create a new user
post '/users' => sub {
    my $user = schema->resultset('User')->create({
        email_address => body_parameters->get('email_address'),
        start_date    => body_parameters->get('start_date'),
    });

    status 'created';
    return $user;
};

# Retrieve a list of users
get '/users' => sub {
    my @users = schema->resultset('User')->all;

    return \@users;
};

# Retrieve a specific user by email address
get '/users/:email_address' => sub {
    my $user = schema->resultset('User')->find(param('email_address'));

    return $user;
};

# Update a user's email address and/or start date
put '/users/:email_address' => sub {
    my $user = schema->resultset('User')->find(param('email_address'));

    if ($user) {
        $user->update({
            email_address => body_parameters->get('email_address'),
            start_date    => body_parameters->get('start_date'),
        });
        return $user;
    } else {
        status 'not_found';
        return { error => 'User not found' };
    }
};

# Delete a user
del '/users/:email_address' => sub {
    my $user = schema->resultset('User')->find(param('email_address'));

    if ($user) {
        $user->delete;
        status 'no_content';
        return;
    } else {
        status 'not_found';
        return { error => 'User not found' };
    }
};

true;

