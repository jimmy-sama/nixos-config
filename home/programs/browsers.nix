{
    pkgs,
    config,
    ...
}: {
    programs = {
        brave = {
            enable = true;
            extensions = [
            # {id = "";}  // extension id, query from chrome web store
            ];
        };
    };
}
