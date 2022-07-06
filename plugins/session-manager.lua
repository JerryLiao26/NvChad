local session_manager = require("session_manager")

session_manager.setup {
    autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir,
}
