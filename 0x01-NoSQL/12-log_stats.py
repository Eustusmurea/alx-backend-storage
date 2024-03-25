#!/usr/bin/env python3
from pymongo import MongoClient
# Connect to MongoDB
client = MongoClient('localhost', 27017)
db = client.logs
collection = db.nginx

# Total number of documents
total_logs = collection.count_documents({})
print(f"{total_logs} logs")

# Count of each HTTP method
http_methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
print("Methods:")
for method in http_methods:
    count = collection.count_documents({"method": method})
    print(f"\tmethod {method}: {count}")

# Count of status check
status_check_count = collection.count_documents({"method": "GET", "path": "/status"})
print(f"{status_check_count} status check")

# Top 10 IPs
print("IPs:")
pipeline = [
    {"$group": {"_id": "$ip", "count": {"$sum": 1}}},
    {"$sort": {"count": -1}},
    {"$limit": 10}
]
top_ips = collection.aggregate(pipeline)
for entry in top_ips:
    print(f"\t{entry['_id']}: {entry['count']}")
