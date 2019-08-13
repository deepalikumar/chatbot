"""Tests"""


def test_connect_and_converse(client):
    with client.websocket_connect("/conversation") as ws:
        ws.send_text("Hello")
        assert ws.receive_text() == "Hello"
