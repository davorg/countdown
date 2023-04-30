use utf8;
package Countdown::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Countdown::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 email_address

  data_type: 'text'
  is_nullable: 0

=head2 start_date

  data_type: 'date'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "email_address",
  { data_type => "text", is_nullable => 0 },
  "start_date",
  { data_type => "date", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</email_address>

=back

=cut

__PACKAGE__->set_primary_key("email_address");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2023-04-30 10:22:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6GEUrlDmwJ8RBl9QYI38TQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
