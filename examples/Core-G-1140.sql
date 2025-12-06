-- Core G-1140: Avoid granting object privileges directly to connect users.

grant read on dbl_configs_v to dbl_backend;
grant read on dbl_config_rules_v to dbl_backend;
