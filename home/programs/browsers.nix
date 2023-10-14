{
    pkgs,
    config,
    ...
}: {
    programs = {
        brave = {
            enable = true;
        };
    };
}
