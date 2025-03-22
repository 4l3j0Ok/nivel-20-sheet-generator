import logging
import config
import sys


def get_logger() -> logging.Logger:
    logger = logging.getLogger(config.Application.log_name)
    level = config.Application.log_level
    logger.setLevel(level)
    formatter = logging.Formatter(
        "%(asctime)s - %(levelname)s - %(module)s - LINE: %(lineno)d - %(message)s"
    )

    # Stream handler using sys.stdout
    stream_handler = logging.StreamHandler(sys.stdout)
    stream_handler.setFormatter(formatter)
    logger.addHandler(stream_handler)

    # File handler with UTF-8 encoding
    file_handler = logging.FileHandler(config.Path.log, encoding="utf-8")
    file_handler.setFormatter(formatter)
    logger.addHandler(file_handler)
    return logger


logger = get_logger()
