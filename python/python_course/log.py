import logging

# Create and configure logger


LOG_FORMAT = "%(levelname)s %(asctime)s - %(message)s"
logging.basicConfig(filename = "haohaibo.log",
                    level = logging.DEBUG,
                    format = LOG_FORMAT)
logger = logging.getLogger()

# Test the logger
logger.info("our first message")
logger.info("our SECOND message")
