require Logger

:application.start :logger
Logger.remove_backend :console
Logger.add_backend {JSONLogex, []}

ExUnit.start()
