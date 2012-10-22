package LDReseller::Admin;

use Dancer ':syntax';

prefix '/admin';

get '/' => sub {
    template 'admin/index';
};

get '/*' => sub {
    my $thing = splat;
    my @t = schema->resultset($thing)->all();
    debug "About to render admin/$thing";
    template "admin/$thing", { $thing => \@t };
};

put '/package' => sub {
    
};

put '/vatrate' => sub {

};

put '/service' => sub {

};

put '/invoice' => sub {

};

put '/invoiceline' => sub {

};

put '/payment' => sub {

};

put '/customer' => sub {

};

put '/user' => sub {

};

put '/password' => sub {

};

put '/role' => sub {

};

1;
