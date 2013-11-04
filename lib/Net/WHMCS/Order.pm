package Net::WHMCS::Order;

# ABSTRACT: WHMCS API Order

use Moo;
with 'Net::WHMCS::Base';

use Carp 'croak';

sub addorder {
	my ($self, $params) = @_;
	$params->{action} = 'addorder';
	foreach my $r (qw/clientid pid/) {
		croak "$r is required." unless exists $params->{$r};
	}
	return $self->build_request($params);
}

=pod

=head2 addorder

	$whmcs->order->addorder({
		clientid => 1,
		pid => 1,
		domain => 'whmcs.com',
		billingcycle => 'monthly',
		...
	});

L<http://docs.whmcs.com/API:Add_Order>

=cut

sub acceptorder {
	my ($self, $params) = @_;
	$params->{action} = 'acceptorder';
	foreach my $r (qw/orderid/) {
		croak "$r is required." unless exists $params->{$r};
	}
	return $self->build_request($params);
}

=pod

=head2 acceptorder

	$whmcs->order->acceptorder({
		orderid => 1
	});

L<http://docs.whmcs.com/API:Accept_Order>

=cut

sub getproducts {
	my ($self, $params) = @_;
	$params->{action} = 'getproducts';
	return $self->build_request($params);
}

=pod

=head2 addorder

	$client->getproducts();

L<http://docs.whmcs.com/API:Get_Products>

=cut

1;