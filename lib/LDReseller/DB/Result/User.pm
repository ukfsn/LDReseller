use utf8;
package LDReseller::DB::Result::User;

use strict;
use warnings;

use base 'DBIx::Class::Core';
use Authen::Passphrase;
use Authen::Passphrase::MD5Crypt;

__PACKAGE__->table("user");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "password",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "customer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "customer",
  "LDReseller::DB::Result::Customer",
  { id => "customer" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

__PACKAGE__->has_many(
  "services",
  "LDReseller::DB::Result::Service",
  { "foreign.user" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->has_many(
  "roles",
  "LDReseller::DB::Result::Role",
  { "foreign.user" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

sub check_password {
    my $self = shift;
    my $password = shift;

    if ( ! $password ) {
        $self->errors('You must provide a password');
        return;
    }

    my $p = Authen::Passphrase->from_crypt($self->password);
    $p->match($password) ? 1 : 0;
}

sub password {
    my $self = shift;
    my $password = shift;

    if ( ! $password ) {
        $self->errors('You must provide a password');
        return;
    }

    $self->update({
        password => Authen::Passphrase::MD5Crypt->new(
            salt_random => 1,
            passphrase => $password
        )->as_crypt
    });
    return 1;
}

1;
