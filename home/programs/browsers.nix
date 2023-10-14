{
    pkgs,
    config,
    ...
}: {
    programs = {
        brave = {
            enable = true;
            extensions = [
                id = "ghmbeldphafepmbegfdlkpapadhbakde" 
            ];
        };
    };
}
