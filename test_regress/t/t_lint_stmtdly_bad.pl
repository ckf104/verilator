#!/usr/bin/env perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2008 by Wilson Snyder. This program is free software; you
# can redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.
# SPDX-License-Identifier: LGPL-3.0-only OR Artistic-2.0

scenarios(vlt => 1);

lint(
    verilator_flags2 => ["--no-timing"],
    fails => 1,
    expect_filename => $Self->{golden_filename},
    );

extract(
    in => $Self->{top_filename},
    out => "../docs/gen/ex_STMTDLY_faulty.rst",
    lines => "10");

extract(
    in => $Self->{golden_filename},
    out => "../docs/gen/ex_STMTDLY_msg.rst",
    lines => "1");

ok(1);
1;
