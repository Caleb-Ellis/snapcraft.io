import os

WEBAPP_CONFIG = {
    'LAYOUT': '_layout.html',
    'STORE_NAME': 'Snap store',
}

RELEASE_UI_ENABLED = os.getenv('RELEASE_UI_ENABLED', '').lower() == 'true'
