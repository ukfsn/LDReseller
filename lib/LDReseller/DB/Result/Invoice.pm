use utf8;
package LDReseller::DB::Result::Invoice;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("invoice");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "customer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "inv_date",
  { data_type => "date", is_nullable => 1 },
  "paid",
  { data_type => "boolean", is_nullable => 1 },
  "vatrate",
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
  "invoicelines",
  "LDReseller::DB::Result::Invoiceline",
  { "foreign.invoice" => "self.id" }
);

__PACKAGE__->belongs_to(
  "vatrate",
  "LDReseller::DB::Result::Vatrate",
  { id => "vatrate" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

1;
