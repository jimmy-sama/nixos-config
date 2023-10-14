{
    pkgs,
    config,
    ...
}: {
    programs = {
        brave.enable = true;
        steam.enable = true;
    };
}
