package Net::WHMCS::Client;

# ABSTRACT: WHMCS API Clients

use Moo;
with 'Net::WHMCS::Base';

sub getclientsdetails {
	my ($self, $params) = @_;
	$params->{action} = 'getclientsdetails';
	return $self->build_request($params);
}

=pod

=head3 getclientsdetails

	$client->getclientsdetails({
		clientid => 1,
		stats => 'true',
	})

http://docs.whmcs.com/API:Get_Clients_Details

=cut

1;