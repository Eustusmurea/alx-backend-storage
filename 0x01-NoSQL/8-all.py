#!/usr/bin/env python3

from pymongo import MongoClient

# Connect to MongoDB
client = MongoClient('mongodb://localhost:27017/')
db = client.my_db  # Specify the database name
collection = db.school  # Specify the collection name

# Call the function to list all documents
documents_list = list_all(collection)

# Print the documents
for document in documents_list:
    print(document)

