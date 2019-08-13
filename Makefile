default: run

.PHONY: run
run:
	uvicorn chatbot.asgi:app --reload

.PHONY: tests
tests:
	PYTHONPATH=. pytest
