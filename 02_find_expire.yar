rule MatchExpiredStr
{
    strings:
        $expire1 = /expired/i
        $expire2 = /([\w\s]\x00)+e\x00x\x00p\x00i\x00r\x00e\x00d\x00/i

    condition:
        $expire1 or $expire2
}