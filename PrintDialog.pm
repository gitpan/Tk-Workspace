package Tk::PrintDialog;
my $RCSRevKey = '$Revision: 0.42 $';
$RCSRevKey =~ /Revision: (.*?) /;
$VERSION=$1;
use vars qw( $VERSION );

=head1 NAME

=head1 VERSION INFORMATION

$Id: SearchDialog.pm,v 0.42 2000/12/30 12:02:47 kiesling Exp $

Author: rkiesling@mainmatter.com <Robert Kiesling>

=cut 


use Tk qw(Ev);
use Carp;
use Tk::widgets qw( LabEntry Button Frame Listbox Scrollbar );
use base qw(Tk::Toplevel);

Construct Tk::Widget 'PrintDialog';

my $defaultfont="*-helvetica-medium-r-*-*-12-*";

sub Populate {
  my ($w, $args) = @_;
  require Tk::Label;
  require Tk::Entry;
  require Tk::Frame;
  require Tk::Checkbutton;

  $w -> SUPER::Populate( $args );

  $w -> ConfigSpecs( -printcommandlabel => ['PASSIVE', undef, undef,
				       'Print Command:' ],
		     -printlabel => ['PASSIVE', undef, undef,
				       'Print' ],
		     -printcommand => ['PASSIVE', undef, undef,
				       '' ],
		     -cancellabel => ['PASSIVE', undef, undef,
				       'Cancel' ]
		    );

  my $f = $w -> Component( Frame => 'entryframe',
			    -container => 0, -relief => 'groove', 
			    -borderwidth => 3 );

  my $s = $w->Component( Label => 'printcommandlabel',
		 -textvariable => \$w->{'Configure'}{'-printcommandlabel'},
		 -font => $defaultfont
	       );

  $s->grid( -in => $f, -column => 1, -row => 1, -padx => 5, -pady => 5,
	    -sticky => 'w', -columnspan => 5 );

  my $pc = $w -> Component( Entry => 'printcommand',
				   -width => 30,
		 -textvariable => \$w -> {'Configure'}{'-printcommand'});

  $pc -> grid(  -in => $f, -column => 1, -row => 2, -padx => 5, 
		     -pady => 5, -columnspan => 5 );

  $f -> grid( -in => $w, -row => 1, -columnspan => 5, -sticky => 'ew',
	    -ipady => 5 );

  my $f1 = $w -> Component( Frame => 'buttonframe',
			  -container => 0, -relief => 'groove', 
			  -borderwidth => 3 );

  my $ab = $f1 -> Component ( Button => 'printbutton',
		      -textvariable => \$w -> {'Configure'}{'-printlabel'},
		      -font => $defaultfont,
		      -default => 'active',
		      -command => ['Accept', $w]) 
    -> grid( -in => $f1, -column => 2, -row => 1, -padx => 10, -pady => 5 );

  my $cb = $f1 -> Component ( Button => 'cancelbutton', 
		      -textvariable => \$w -> {'Configure'}{'-cancellabel'},
		      -font => $defaultfont,
		    -default => 'normal',
		    -command => ['Cancel', $w])
    -> grid( -in => $f1, -column => 4, -row => 1, -padx => 20, -pady => 2 );

  $f1 -> grid( -in => $w, -row => 7, -columnspan => 5, -sticky => 'ew' );

  return $w;
}

sub Accept {
  my ($w, $args) = @_;
  $w -> {'Configure'}{'-accept'} = '1';
}

sub Cancel {
  shift -> withdraw;
  return undef;
}

sub Show {
  my ($w, $args) = @_;
  $w -> waitVariable( \$w -> {'Configure'}{'-accept'} );
  $w -> withdraw;
  return %{$w -> {'Configure'}};
}

1;
__END__;
