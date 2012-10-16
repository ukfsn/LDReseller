use utf8;
package LDReseller::DB::Result::Service;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("service");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "package",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "user",
  { data_type => "", is_foreign_key => 1, is_nullable => 1 },
  "start_date",
  { data_type => "date", is_nullable => 1 },
  "renew_date",
  { data_type => "date", is_nullable => 1 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "invoicelines",
  "LDReseller::DB::Result::Invoiceline",
  { "foreign.service" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->belongs_to(
  "package",
  "LDReseller::DB::Result::Package",
  { id => "package" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

__PACKAGE__->belongs_to(
  "user",
  "LDReseller::DB::Result::User",
  { id => "user" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

1;
