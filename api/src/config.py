import os


class Application:
    name = "Nivel 20 5e Sheet Generator API"
    version = os.getenv("APP_VERSION", "0.0.0")
    dev_mode = os.getenv("DEV_MODE", False)
    log_level = os.getenv("LOG_LEVEL", "INFO")
    log_name = "api"
    host = os.getenv("HOST", "localhost")
    port = os.getenv("PORT", 8000)


class Path:
    current = os.path.dirname(os.path.abspath(__file__))
    log = f"{current}/{Application.log_name}.log"
