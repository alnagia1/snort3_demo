#!/usr/bin/env bats

PCAP="byte_test.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Byte Extract and Byte Test with and without a Bitmask" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

