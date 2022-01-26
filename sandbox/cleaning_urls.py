from distutils.command.clean import clean
from urllib.parse import urlparse

url = "https://github.com/stedolan/jq/issues/124#issuecomment-17875972"

cleaned = urlparse(url)
print(
    cleaned.netloc + cleaned.path
)