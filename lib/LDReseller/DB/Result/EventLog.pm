use utf8;
package LDReseller::DB::Result::EventLog;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("event_log");

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "customer",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "eventdate",
  { data_type => "date", is_nullable => 1 },
  "event",
  { data_type => "varchar", is_nullable => 1, size => 255 },
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

1;
