#!/usr/bin/env perl
use Dancer;
use strict;

use DBI;

my $db = DBI->connect("dbi:SQLite:paste.db") || die "couldn't open";

get '/' => sub
{
     template 'request.tt', {
	 'header' => 'perlpaste - a pastebin in perl',
	 'text'   => 'the text',
     };
};

post '/paste' => sub
{
    my $title = param('title');
    my $paste = param('paste');
    $db->do("insert into pastes (title,paste) values ('$title','$paste')");
    my $key = $db->selectall_arrayref("select pastekey from pastes where paste = '$paste'");
    my $link = "http://perlpaste.com/pastes/@$key[0]";
    template 'paste.tt', {
	'title' => $title,
	'paste' => $paste,
	'key'   => @$key[0],
	'link'  => $link,
    };
};

get '/pastes/:id' => sub {
    my $id = params->{id};
    my $title = $db->selectall_arrayref("select title from pastes where pastekey = $id");
    my $paste = $db->selectall_arrayref("select paste from pastes where pastekey = $id");
    template 'paste.tt', {
	'title' => @$title[0],
	'paste' => @$paste[0],
	'key'   => $id,
	'link'  => '',
    };
};

dance;
