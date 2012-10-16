package LDReseller;
use Dancer ':syntax';
use Dancer::Plugin::DBIC 'schema';
use Dancer::Plugin::FlashMessage;

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

true;
