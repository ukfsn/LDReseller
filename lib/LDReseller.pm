package LDReseller;
use Dancer ':syntax';
use Dancer::Plugin::DBIC 'schema';
use Dancer::Plugin::FlashMessage;

our $VERSION = '0.1';

schema->deploy;

get '/' => sub {
    template 'index';
};

post '/order' => sub {

};

true;
