import pytest
from bocadillo import provider, create_client

from chatbot.asgi import app


@provider
async def diego():
    class EchoDiego:
        def get_response(self, query):
            return query

    return EchoDiego()


@pytest.fixture
def client():
    return create_client(app)

