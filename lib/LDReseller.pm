package LDReseller;
use Dancer ':syntax';
use Dancer::Plugin::DBIC 'schema';
use Dancer::Plugin::FlashMessage;

our $VERSION = '0.1';

schema->deploy;

get '/' => sub {
    template 'index';
};

post '/login' => sub {
    if ( ! params->{login} || ! params->{password} ) {
        return template 'login';
    }
    my $auth = auth(params->{login}, params->{password});
    # XXX Carry on!

};

post '/order' => sub {

};

true;
