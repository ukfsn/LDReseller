use utf8;
package LDReseller::DB::Result::Vatrate;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("vatrate");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "rate",
  { data_type => "decimal", is_nullable => 0, size => [5, 2] },
  "start_date",
  { data_type => "date", is_nullable => 1 },
  "end_date",
  { data_type => "date", is_nullable => 1 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "invoices",
  "LDReseller::DB::Result::Invoice",
  { "foreign.vatrate" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
