rule MatchUrl
{
    strings:
        $urlPattern1 = /https?:\/\/([^\x00-\x0A]*)/
        $urlPattern2 = /h\x00t\x00t\x00p\x00(s\x00)?:\x00\/\x00\/\x00([^\x01-\x0A]*)/

    condition:
        $urlPattern1 or $urlPattern2
}