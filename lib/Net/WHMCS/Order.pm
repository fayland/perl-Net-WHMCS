package Net::WHMCS::Order;

# ABSTRACT: WHMCS API Order

use Moo;
with 'Net::WHMCS::Base';

use Carp 'croak';

sub addorder {
	my ($self, $params) = @_;
	$params->{action} = 'AddOrder';
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

L<https://developers.whmcs.com/api-reference/addorder/>

=cut

sub acceptorder {
	my ($self, $params) = @_;
	$params->{action} = 'AcceptOrder';
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

L<https://developers.whmcs.com/api-reference/acceptorder/>

=cut

sub deleteorder {
	my ($self, $params) = @_;
	$params->{action} = 'DeleteOrder';
	croak "orderid is required." unless exists $params->{orderid};
	return $self->build_request($params);
}

=pod

=head2 deleteorder

	$client->deleteorder({
		orderid => 1
	});

L<https://developers.whmcs.com/api-reference/deleteorder/>

=cut

sub getproducts {
	my ($self, $params) = @_;
	$params->{action} = 'GetProducts';
	return $self->build_request($params);
}

=pod

=head2 getproducts

	$client->getproducts();

L<https://developers.whmcs.com/api-reference/getproducts/>

=cut

1;
