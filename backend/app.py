from flask import Flask, request, jsonify
import requests

app = Flask(__name__)

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