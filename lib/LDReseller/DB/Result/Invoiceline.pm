use utf8;
package LDReseller::DB::Result::Invoiceline;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("invoiceline");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "invoice",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "service",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "amount",
  { data_type => "decimal", is_nullable => 1, size => [5, 2] },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->belongs_to(
  "invoice",
  "LDReseller::DB::Result::Invoice",
  { id => "invoice" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

__PACKAGE__->belongs_to(
  "service",
  "LDReseller::DB::Result::Service",
  { id => "service" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

1;
