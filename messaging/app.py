from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/notify', methods=['POST'])
def notify():
    data = request.json
    # Logic to send notifications (e.g., WebSocket, Firebase, etc.)
    print(f"Notification: {data['message']}")
    return jsonify({"status": "success"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=6000)