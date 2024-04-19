import json

def group_and_store_data(data, file_name):
    # Group the data (for simplicity, let's assume we group by data type)
    grouped_data = {}
    for item in data:
        data_type = type(item).__name__
        if data_type not in grouped_data:
            grouped_data[data_type] = []
        grouped_data[data_type].append(item)

    # Store the grouped data in an external file (JSON format for simplicity)
    with open(file_name, 'w') as file:
        json.dump(grouped_data, file)

# Example usage
data = ["John", "Alice", 42, 3.14, True, "Bob"]
file_name = "grouped_data.json"
group_and_store_data(data, file_name)
print("Data stored successfully in", file_name)
