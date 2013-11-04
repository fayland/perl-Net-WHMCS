package Net::WHMCS::Support;

# ABSTRACT: WHMCS API Support

use Moo;
with 'Net::WHMCS::Base';

sub openticket {
	my ($self, $params) = @_;
	$params->{action} = 'openticket';
	return $self->build_request($params);
}

=pod

=head2 openticket

	$whmcs->support->openticket({
		clientid => 1,
		deptid => 1,
		subject => 'subject',
		message => 'message'
	});

L<http://docs.whmcs.com/API:Open_Ticket>

=cut

1;