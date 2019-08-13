"""Application definition."""
from bocadillo import App, discover_providers

app = App()
discover_providers("chatbot.providerconf")

# Create routes here.
@app.websocket_route("/conversation")
async def converse(ws):
    async for message in ws:
        await ws.send(message)


@app.route("/")
async def home(req, res):
    res.text = "Hello, World!"


if __name__ == "__main__":
    import uvicorn
    uvicorn.run("chatbot.asgi:app", host="0.0.0.0")
