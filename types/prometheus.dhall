let Label = { mapKey : Text, mapValue : Text }

let StaticConfig =
    { targets : List Text
    , labels : Optional (List Label)
    }
let RelabelConfig = { }

let AlertManagerConfig =
    { static_configs : Optional (List StaticConfig)
    }

let GlobalConfig =
    { scrape_interval : Text
    , evaluation_interval : Text
    , external_labels : Optional (List { mapKey : Text, mapValue : Text })
    }
let ScrapeConfig =
    { job_name : Text
    }
let Alerting =
    { alert_relabel_configs : Optional (List RelabelConfig)
    , alertmanagers : Optional (List AlertManagerConfig)
    }

let Config =
    { global : GlobalConfig
    , rule_files : List Text
    , scrape_config_files : List Text
    , scrape_configs : Optional (List ScrapeConfig)
    , alerting : Optional Alerting
    }

in  { Config = Config

    , GlobalConfig = GlobalConfig
    , ScrapeConfig = ScrapeConfig
    , Alerting = Alerting

    , AlertManagerConfig = AlertManagerConfig

    , StaticConfig = StaticConfig
    , RelabelConfig = RelabelConfig

    , Label = Label
    }
