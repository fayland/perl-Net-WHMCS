package Net::WHMCS::Support;

# ABSTRACT: WHMCS API Clients

use Moo;
with 'Net::WHMCS::Base';

sub openticket {
	my ($self, $params) = @_;
	$params->{action} = 'openticket';
	return $self->build_request($params);
}

=pod

=head3 openticket

	$client->openticket({
		clientid => 1,
		deptid => 1,
		subject => 'subject',
		message => 'message'
	});

http://docs.whmcs.com/API:Open_Ticket

=cut

1;