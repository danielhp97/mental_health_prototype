from flask import Flask, request, jsonify
import requests
from fastapi import FastAPI
from ..backend.database import create_db_and_tables_with_retry
from ..backend.routers import task_router, user_router, psychological_test_router


app = FastAPI()

# Include routers
app.include_router(task_router, prefix="/tasks", tags=["tasks"])
app.include_router(user_router, prefix="/users", tags=["users"])
app.include_router(psychological_test_router, prefix="/psychological_tests", tags=["psychological_tests"])

# Initialize the database on startup
@app.lifespan("startup")
def on_startup():
    create_db_and_tables_with_retry()


# Mock database
items = []

@app.route('/items', methods=['POST'])
def add_item():
    data = request.json
    item = {"id": len(items) + 1, "name": data['name']}
    items.append(item)

    # Notify messaging service
    requests.post('http://messaging:6000/notify', json={"message": f"Item '{item['name']}' added!"})

    return jsonify(item), 201

@app.route('/items', methods=['GET'])
def get_items():
    return jsonify(items)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)