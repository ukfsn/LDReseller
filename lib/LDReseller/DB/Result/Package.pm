use utf8;
package LDReseller::DB::Result::Package;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("package");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "price",
  { data_type => "decimal", is_nullable => 0, size => [5, 2] },
  "description",
  { data_type => "text", is_nullable => 0 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "services",
  "LDReseller::DB::Result::Service",
  { "foreign.package" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

1;
