#!/usr/bin/perl -w

#=============================================================================
#
# $Id: 01glider.t,v 0.04 2001/07/04 02:49:35 mneylon Exp $
# $Revision: 0.04 $
# $Author: mneylon $
# $Date: 2001/07/04 02:49:35 $
# $Log: 01glider.t,v $
# Revision 0.04  2001/07/04 02:49:35  mneylon
#
# Fixed distribution problem
#
# Revision 0.03  2001/07/04 02:28:10  mneylon
#
# Updated README for distribution
#
# Revision 0.02  2001/07/04 02:24:58  mneylon
#
# Test cases for Game::Life
#
#
#=============================================================================

use strict;
use Game::Life;

require 't/compare-boards.pl';

print "1..1\n";

my @starting = qw(
		  .......
		  .......
		  ..XXX..
		  ..X....
		  ...X...
		  .......
		  .......
		  ....... );

my @ending = qw(
		XXX....
		X......
		.X.....
		.......
		.......
		.......
		....... );

my $game = new Game::Life( 7 );
$game->place_text_points( 0, 0, 'X', @starting );
$game->process( 8 );
my @real_end = $game->get_text_grid( 'X', '.' );
print compare_boards( \@ending, \@real_end ) ? "ok 1\n" : "not ok 1\n";
