# NoSQL

## Resources
- [NoSQL Databases Explained]
- [What is NoSQL?]
- [MongoDB with Python Crash Course - Tutorial for Beginners]
- [MongoDB Tutorial 2: Insert, Update, Remove, Query]
- [Aggregation]
- [Introduction to MongoDB and Python]
- [mongo Shell Methods]
- [Mongosh]

## Learning Objectives
At the end of this project, you are expected to be able to explain to anyone, without the help of Google:
- What NoSQL means
- Difference between SQL and NoSQL
- ACID properties
- Document storage
- NoSQL types
- Benefits of a NoSQL database
- How to query information from a NoSQL database
- How to insert/update/delete information from a NoSQL database
- How to use MongoDB

## Requirements
### MongoDB Command File
- All your files will be interpreted/compiled on Ubuntu 18.04 LTS using MongoDB (version 4.2)
- All your files should end with a new line
- The first line of all your files should be a comment: `// my comment`
- A `README.md` file, at the root of the folder of the project, is mandatory
- The length of your files will be tested using `wc`

### Python Scripts
- All your files will be interpreted/compiled on Ubuntu 18.04 LTS using python3 (version 3.7) and PyMongo (version 3.10)
- All your files should end with a new line
- The first line of all your files should be exactly `#!/usr/bin/env python3`
- A `README.md` file, at the root of the folder of the project, is mandatory
- Your code should use the pycodestyle style (version 2.5.*)
- The length of your files will be tested using `wc`
- All your modules should have documentation (`python3 -c 'print(__import__("my_module").__doc__)'`)
- All your functions should have documentation (`python3 -c 'print(__import__("my_module").my_function.__doc__)'`)
- Your code should not be executed when imported (by using `if __name__ == "__main__":`)

## More Info
- Install MongoDB 4.2 in Ubuntu 18.04: [Official installation guide](#)
- Potential issue if documents creation doesn’t work or this error: Data directory /data/db not found., terminating (source and source)
  - `$ sudo mkdir -p /data/db`
- If `/etc/init.d/mongod` is missing, please find here an example of the file: [Click to expand/hide file contents](#)
- Use "container-on-demand" to run MongoDB
  - Ask for container Ubuntu 18.04 - MongoDB
  - Connect via SSH or via the WebTerminal
  - In the container, you should start MongoDB before playing with it: `$ service mongod start`
- To list databases, run: `$ cat 0-list_databases | mongo`
