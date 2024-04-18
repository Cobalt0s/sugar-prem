CREATE TABLE IF NOT EXISTS upgrade_history
(
    date_modified   varchar(20),
    name            varchar(20),
    description     varchar(20),
    id_name         varchar(20),
    manifest        VARCHAR(20),
    packageManifest VARCHAR(20),
    patch           VARCHAR(20),
    enabled         VARCHAR(20),
    process_status  VARCHAR(20),
    deleted         VARCHAR(20),
    published_date  VARCHAR(20),
    uninstallable   VARCHAR(20),

    id              varchar(20),
    filename        varchar(20),
    md5sum          varchar(20),
    type            varchar(20),
    version         varchar(20),
    status          varchar(20),
    date_entered    DATE
);
CREATE TABLE IF NOT EXISTS config
(
    category varchar(20),
    name     varchar(20),
    platform varchar(20),
    value    varchar(20)
);