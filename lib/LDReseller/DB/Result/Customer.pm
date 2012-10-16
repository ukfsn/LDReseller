use utf8;
package LDReseller::DB::Result::Customer;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("customer");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "company",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "street",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "town",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "county",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "postcode",
  { data_type => "varchar", is_nullable => 1, size => 10 },
  "country",
  { data_type => "char", is_nullable => 1, size => 2 },
  "telephone",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 120 },
  "status",
  { data_type => "char", is_nullable => 1, size => 1 },
);

__PACKAGE__->set_primary_key("id");

__PACKAGE__->has_many(
  "event_logs",
  "LDReseller::DB::Result::EventLog",
  { "foreign.customer" => "self.id" }
);

__PACKAGE__->has_many(
  "invoices",
  "LDReseller::DB::Result::Invoice",
  { "foreign.customer" => "self.id" }
);

__PACKAGE__->has_many(
  "users",
  "LDReseller::DB::Result::User",
  { "foreign.customer" => "self.id" }
);

1;
