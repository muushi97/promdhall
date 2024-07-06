let T = ../types/prometheus.dhall
in  { global =
        { scrape_interval = "15s"
        , evaluation_interval = "15s"
        , external_labels = Some [ { mapKey = "monitor", mapValue = "codelab-monitor" } ]
        }
    , rule_files = [ "./rule.d" ]
    , scrape_config_files = [ "./scrape.d" ]
    , scrape_configs = None (List T.ScrapeConfig)
    , alerting =
        Some
            { alert_relabel_configs = None (List T.RelabelConfig)
            , alertmanagers =
                Some
                    [
                        { static_configs =
                            Some
                                [
                                    { targets = [ "192.168.0.10:9093" ]
                                    , labels = None (List T.Label)
                                    }
                                ]
                        }
                    ]
            }
    } : T.Config
