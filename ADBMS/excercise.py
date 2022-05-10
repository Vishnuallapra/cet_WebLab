# Create a database named college and create collection to list and insert some values to it.

# write mongodb query to

# 1. display name (fname, Iname) and mark of all female student in MCA department 
# 2. display the details of student highest mark in the course MCA 
# 3. display all male student who secure A+ grade

# 4. dtplay the names of the top 3 students in mechanical dpt

# 5. display details of female student (fname, Iname nark) who achieve mark more than 98 
# 6. display the detalls of student whto secured mark morethan 80 but less than 90

# 7. display the names of student whose name starts with B 
# 8. diplay all students from kollam 
# 9. diplay all student who does not belongs to neither kollan nor trivandrum

# 10. display all female student who belongs to either kollam or trivandrum


from pymongo import MongoClient as MC

client = MC("localhost", 27017)

COLLEGE_DB = client.college
COLLECTION = COLLEGE_DB.students

print("Female students of MCA Department: ")
query = COLLECTION.find({"gender":"female"}) #Collect
for q in query:
    print(q["name"]["fname"] + q["name"]["lname"])


print("\nStudent with highest mark in MCA department: ")
query = COLLECTION.find({}).sort("mark", -1)
print(query[0])

print("\nMale students who secured A+: ")
query = COLLECTION.find({"grade":"A+", "gender":"male"})
for q in query:
    print(q["name"]["fname"] + q["name"]["lname"])

print("\nNames of Top 3 Mechanical Students: ")
query = COLLECTION.find({"course": "Mechanical"}).sort("mark", -1).limit(3)
for q in query:
    print(q["name"]["fname"] + q["name"]["lname"])

print("\nNames of Female students who scored more than 98: ")
query = COLLECTION.find({"mark":{"$gt": 98}, "gender":"female"})
for q in query:
    print(q["name"]["fname"] + q["name"]["lname"])

print("\nNames of students who scored more than 80 but less than 90: ")
query = COLLECTION.find({"mark":{"$gt": 80, "$lt":90}})
for q in query:
    print(q["name"]["fname"] + q["name"]["lname"])

print("\Details of students whose name starts with 'B': ")
query = COLLECTION.find({"name.fname": {"$regex": "^(B)"}})
for q in query:
    print(q["name"]["fname"] + q["name"]["lname"])    

print("\nNames of students who are from Kollam: ")
query = COLLECTION.find({"address.city":"Kollam"})
for q in query:
    print(q["name"]["fname"] + q["name"]["lname"])

print("\nNames of students who are from neither Kollam nor Trivandrum: ")
query = COLLECTION.find({"address.city":{"$ne": "Kollam", "$ne":"Trivandrum"}})
for q in query:
    print(q["name"]["fname"] + q["name"]COLLEGE_DB = client.college
["lname"])

print("\nNames of students who are from Kollam or Trivandrum: ")
query = COLLECTION.find({"address.city":{"$in": ["Kollam", "Trivandrum"]}})
for q in query:
    print(q["name"]["fname"] + q["name"]["lname"])
