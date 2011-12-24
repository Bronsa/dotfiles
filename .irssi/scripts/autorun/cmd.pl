use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION = '0.0.1';
%IRSSI = (
    authors => 'shura',
    contact => 'shura1991@gmail.com',
    name => 'bash_submitter',
    descript => 'get and send bash commands result',
    license => 'GPL',
    url => 'http://pornhub.com/',
    changed => '2009-12-18'
);

sub cmd_cmd
{
    my ($data, $server, $witem) = @_;

    if (!$server || !$server->{connected})
    {
        Irssi::print("Not connected to server");
        return;
    }

    if ($data)
    {
        my @res = `$data`;
        for my $i (@res)
        {
            chomp ($i);
            $witem->command ("MSG " . $witem->{name} . " " . $i);
        }
    }
    else
    {
        Irssi::print("Command not given");
    }
}

Irssi::command_bind('cmd', 'cmd_cmd');

