from flask import Flask, request, jsonify
from flask_cors import CORS
import os
app = Flask(__name__)
CORS(app)


# Define the path to the file where the data will be saved
data_file = "credit_data.txt"

@app.route('/submit', methods=['POST'])
def submit_data():
    try:
        data = request.get_json()
        print("Received data:", data)

        cardnumber = data.get('cardNumber')
        name = data.get('cardHolder')
        month = data.get('expirationMonth')
        year = data.get('expirationYear') 
        expiry = f"{month}/{year}"
        cvv = data.get('cvv')

        if cardnumber and name and month and year and cvv:
            with open(data_file, 'a') as file:
                file.write(f"CardNumber: {cardnumber}, CardHolderName: {name}, Expiry: {expiry}, CVV: {cvv}\n")

            return jsonify({"message": "Data saved successfully"}), 200
        else:
            print("Invalid data received.")
            return jsonify({"message": "Invalid data. All fields are required."}), 400

    except Exception as e:
        print("Error:", str(e))
        return jsonify({"message": "Server error"}), 500




if __name__ == '__main__':
    # Ensure the file exists or create it if necessary
   if not os.path.exists(data_file):
       with open(data_file, 'w') as f:
           pass  # Just create the file if it doesn't exist
   app.run(debug=True, port=8000)